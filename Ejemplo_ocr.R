install.packages(c("pdftools", "tesseract"))

#llamar librerías

library(tidyverse)
library(pdftools)
library(tesseract)

## caso 1

# Using poppler version 22.04.0
border_patrol <- pdf_text("usbp_stats_fy2017_sector_profile.pdf")

sector_profile[1]


grep("Miami", sector_profile)
grep("Nationwide Total", sector_profile)

sector_profile <- sector_profile[grep("Miami", sector_profile):
                                   grep("Nationwide Total", sector_profile)]


sector_profile <- str_split_fixed(sector_profile, " {2,}", 10)



renv::clean()
renv::remove("pdftools")
renv::install("pdftools")


## caso 2

eng <- tesseract("eng")

text <- tesseract::ocr("http://jeroen.github.io/images/testocr.png", engine = eng)

cat(text)

pngfile <- pdftools::pdf_convert('https://jeroen.github.io/images/ocrscan.pdf', dpi = 600)
text <- tesseract::ocr(pngfile)
cat(text)


