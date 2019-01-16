## Run all file to prepare "Getting Started in R and data.table" workshop

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

# Create zip file to share with participants
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

zip(here("Share", "GSiRdt.zip"), "Share/", extras = "-FS")

# file.copy(here("Exercises", "World-Popn", "World-Population-Solutions.Rmd"),
#           here("Share", "Solutions"), overwrite = TRUE)
#
# file.copy(here("Exercises", "World-Popn", "World-Population-Solutions.html"),
#           here("Share", "Solutions"), overwrite = TRUE)
