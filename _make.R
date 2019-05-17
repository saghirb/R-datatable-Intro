## Run all files to prepare "Getting Started in R and data.table" workshop

# Setup
library(here)
here()

# Render the presentation, Base R exercises and data.table exercises & solutions
rmarkdown::render(here("Presentation", "R-and-data.table-Workshop.Rmd"),
                  clean = TRUE, output_dir = here("Presentation"))
rmarkdown::render(here("Exercises", "Base-R", "Base-R-Exercises.Rmd"), clean = TRUE,
                  output_dir = here("Exercises", "Base-R"))
rmarkdown::render(here("Exercises", "World-Popn", "World-Population-dt-Exercises.Rmd"),
                  clean = TRUE, output_dir = here("Exercises", "World-Popn"))
rmarkdown::render(here("Exercises", "World-Popn", "World-Population-dt-Solutions.Rmd"),
                  clean = TRUE, output_dir = here("Exercises", "World-Popn"))

# Create a PDF version of the slides to share
library(webshot)
htmlSlides <- paste0("file://",
                     normalizePath(here("Presentation", "R-and-data.table-Workshop.html")))
webshot(htmlSlides, here("Presentation", "R-and-data.table-Workshop.pdf"),
        vwidth = 960, vheight = 540, zoom = 1.5, cliprect = "viewport")


# Create zip files to share with participants
# First empty the share folder and recreate the directory structure.
unlink(here("Share/"), recursive = TRUE)
dir.create(here("Share"))
dir.create(here("Share", "R-Concepts"))
dir.create(here("Share", "Slides-Notes"))
dir.create(here("Share", "World-Popn"))

# Populate the Share directories
file.copy(here("Exercises", "Base-R", "Base-R-Exercises.pdf"),
          here("Share", "R-Concepts"), overwrite = TRUE)

file.copy(here("Presentation", "R-and-data.table-Workshop.html"),
          here("Share", "Slides-Notes"), overwrite = TRUE)

file.copy(here("Presentation", "R-and-data.table-Workshop.pdf"),
          here("Share", "Slides-Notes"), overwrite = TRUE)


download.file("https://github.com/eddelbuettel/gsir-te/raw/master/Getting-Started-in-R.pdf",
              here("Share", "Slides-Notes", "Getting-Started-in-R.pdf"))

file.copy(here("Exercises", "World-Popn", "World-Population-dt-Exercises.Rmd"),
          here("Share", "World-Popn"), overwrite = TRUE)

file.copy(here("Exercises", "World-Popn", "World-Population.csv"),
          here("Share", "World-Popn"), overwrite = TRUE)

file.copy(here("Exercises", "World-Popn", "World-Population-Data-Info.txt"),
          here("Share", "World-Popn"), overwrite = TRUE)

# Creating (initialising) an RStudio project
rstudioapi::initializeProject(path = here("Share", "World-Popn"))
file.rename(here("Share", "World-Popn", "World-Popn.Rproj"),
          here("Share", "World-Popn", "World-Popn-dt.Rproj"))

# Using here() function with zip results in full paths in the zip files :(
# Not beautiful: Using setwd to overcome the full paths issue above.
setwd(here())
zip(here("Share", "GSiRdt.zip"), "./Share/", extras = "-FS")

setwd(here("Exercises", "World-Popn"))
zip(here("Share", "World-Popn-dt-Solutions.zip"), "World-Population-dt-Solutions.html",
    extras = "-FS")
setwd(here())
