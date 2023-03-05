library(tidyverse)

#opening the relevant data-sets
calendar <- read_csv('calendar.csv')

listings <- read_csv('listings.csv')

listings2 <- read_csv('listings-2.csv')


#deleting unimportant columns listings2
listings2columns <- subset(listings2, select = c(id, last_scraped, name, neighbourhood, property_type, room_type, accommodates, bathrooms, bathrooms_text, bedrooms, beds, amenities, price, minimum_nights, maximum_nights, number_of_reviews, review_scores_rating))
# max(listings2columns$last_scraped)
# "2022-12-12"
# min(listings2columns$last_scraped) 
# "2022-12-11"
# shows that the dataset is created between november and december 2022. 

#deleting unimportant columns listings
listingscolumns <- subset(listings, select = c(id, neighbourhood_group, calculated_host_listings_count, price))
                               
#joining listings datasets
listings_joined <- listings2columns %>% left_join(listingscolumns, by = c("id" = "id"))

