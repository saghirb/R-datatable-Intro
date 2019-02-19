## Run all files to prepare "Getting Started in R and data.table" workshop

# Setup
library(here)
here()

# Render the presentation, Base R exercises and data.table exercises & solutions
rmarkdown::render(here("Presentation", "R-and-data.table-Workshop.Rmd"),
                  clean = TRUE, output_dir = here("Presentation"))
rmarkdown::render(here("Exercises", "Base-R", "Base-R-Exercises.Rmd"), clean = TRUE,
                  output_dir = here("Exercises", "Base-R"))
rmarkdown::render(here("Exercises", "World-Popn", "World-Population-Exercises.Rmd"),
                  clean = TRUE, output_dir = here("Exercises", "World-Popn"))
rmarkdown::render(here("Exercises", "World-Popn", "World-Population-Solutions.Rmd"),
                  clean = TRUE, output_dir = here("Exercises", "World-Popn"))

# Create zip files to share with participants
# First empty the share folder and recreate the directory structure.
unlink(here("Share/*"), recursive = TRUE)
dir.create(here("Share", "R-Concepts"))
dir.create(here("Share", "Slides-Notes"))
dir.create(here("Share", "World-Popn"))

# Populate the Share directories
file.copy(here("Exercises", "Base-R", "Base-R-Exercises.pdf"),
          here("Share", "R-Concepts"), overwrite = TRUE)

file.copy(here("Presentation", "R-and-data.table-Workshop.html"),
          here("Share", "Slides-Notes"), overwrite = TRUE)

download.file("https://github.com/eddelbuettel/gsir-te/raw/master/Getting-Started-in-R.pdf",
              here("Share", "Slides-Notes", "Getting-Started-in-R.pdf"))

file.copy(here("Exercises", "World-Popn", "World-Population-Exercises.Rmd"),
          here("Share", "World-Popn"), overwrite = TRUE)

file.copy(here("Exercises", "World-Popn", "World-Population.csv"),
          here("Share", "World-Popn"), overwrite = TRUE)

file.copy(here("Exercises", "World-Popn", "World-Population-Data-Info.txt"),
          here("Share", "World-Popn"), overwrite = TRUE)

# Creating (initialising) an RStudio project
rstudioapi::initializeProject(path = here("Share", "World-Popn"))

# Using here() function with zip results in full paths in the zip files :(
# Not beautiful: Using setwd to overcome the full paths issue above.
setwd(here())
zip(here("Share", "GSiRdt.zip"), "./Share/", extras = "-FS")

setwd(here("Exercises", "World-Popn"))
zip(here("Share", "World-Popn-solutions.zip"), "World-Population-Solutions.html",
    extras = "-FS")
setwd(here())
