# Download dataset 1

## Calendar.csv.gz
download.file('http://data.insideairbnb.com/spain/catalonia/barcelona/2022-12-11/data/calendar.csv.gz', './src/data-preparation/calendar.csv.gz')
calendar <- read_csv("calendar.csv.gz")

## Listings.csv
download.file('http://data.insideairbnb.com/spain/catalonia/barcelona/2022-12-11/data/listings.csv.gz', './src/data-preparation/listings.csv.gz')
listings_unsorted <- read_csv("listings.csv.gz")
