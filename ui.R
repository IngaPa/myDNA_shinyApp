ui <- fluidPage(

  # removes all warnings messages
  tags$style(type="text/css",
             ".shiny-output-error { visibility: hidden; }",
             ".shiny-output-error:before { visibility: hidden; }"),

  sidebarLayout(
    sidebarPanel(
      fileInput("genotype", "Choose genotype file",
                accept = c(
                  "text/csv",
                  "text/comma-separated-values,text/plain",
                  ".csv")),
      tags$hr(),
      selectInput("Trait","Trait",c("all",
                                    "Alzheimer's disease (late onset)",
                                    "Attention deficit hyperactivity disorder",
                                    "Celiac disease",
                                    "Crohn's disease",
                                    "Cognitive performance",
                                    "Coronary heart disease",
                                    "Bipolar disorder",
                                    "Bone mineral density",
                                    "Breast cancer",
                                    "Cholesterol, total",
                                    "Body mass index",
                                    "Hypertension",
                                    "HDL cholesterol",
                                    "Intelligence",
                                    "LDL cholesterol",
                                    "Longevity",
                                    "Migraine",
                                    "Multiple sclerosis",
                                    "Obesity-related traits",
                                    "Schizophrenia",
                                    "Systemic lupus erythematosus",
                                    "Obesity",
                                    "Parkinson's disease",
                                    "Rheumatoid arthritis",
                                    "Thyroid hormone levels",
                                    "Triglycerides",
                                    "Tuberculosis",
                                    "Type 1 diabetes",
                                    "Type 2 diabetes",
                                    "Height")),
      downloadButton('download',"Download the data")
    ),
    mainPanel(h1("Your raw genotype data looks as..."),
              tableOutput("contents"),
              h1("Genotypes for your trait look as..."),
              tableOutput("trait"))
  )
)
