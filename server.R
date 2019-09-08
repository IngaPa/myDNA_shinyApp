


  server <- function(input, output) {

    # select what you wanna visualize
    infoOfInterect <- c("DISEASE.TRAIT",
                        "rsid",
                        "genotype",
                        "STRONGEST.SNP.RISK.ALLELE",
                        "myAllele",
                        "RISK.ALLELE.FREQUENCY",
                        "P.VALUE",
                        "OR.or.BETA",
                        "REPORTED.GENE.S.",
                        "CONTEXT",
                        "MAPPED_GENE",
                        "STUDY",
                        "LINK")


    # ------------------------------------------
    # create interactive variables
                inFile <- reactiveVal(NULL) # Set the value to NULL to initialize
                selectedTrait <- reactiveVal(NULL) # Set the value to NULL to initialize

                # Make myGenome a reactive so it can be read within a shiny reactive
                myGenome <- reactive({
                      inFile <- input$genotype
                      if (is.null(inFile))
                        return(NULL)
                      myDNA::importDNA(inFile$datapath)
                 })

                # Make trait a reactive so it can be read within a shiny reactive
                traitOf <- reactive({
                    selectedTrait <- input$Trait
                    if (is.null(selectedTrait))
                      return("all")# if trait is NULL, select all traits
                    selectedTrait
                    })

                screenResults <- reactive({

                  screenedGenome <- myDNA::myDNAScreenDB(myGenome(),
                                     database = "ebicat37",
                                     trait = traitOf())

                          screenedGenome <- screenedGenome[,infoOfInterect]

                          if (is.null(screenedGenome)){return(NULL)}
                          if (!is.null(screenedGenome)){return(screenedGenome)}

                })



    #--------------------------------------
    # output

            output$contents <- renderTable({ head(myGenome()) })

            output$trait <- renderTable({ screenResults() })

            # downloading results
            output$download <- downloadHandler(
                                  filename = function(){paste0(traitOf(),"_myDNAscreened.csv")},
                                  content = function(fname){ write.csv(screenResults(), fname) })

  }



  # shinyApp(ui, server)

