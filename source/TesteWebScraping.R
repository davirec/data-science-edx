library(tidyverse) 
library(dslabs)
path <- system.file("extdata", package="dslabs")
filename <- file.path(path,  "fertility-two-countries-example.csv")
wide_data <- read_csv(filename)


new_tidy_data <- gather(wide_data, year, fertility, `1960`:`2015`)
