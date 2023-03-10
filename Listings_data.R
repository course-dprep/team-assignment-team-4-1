library("tidyverse")

listings <- read_csv("listings-2.csv")

#deleting unimportant columns 
listings <- subset(listings, select = c(id, name, neighbourhood, property_type, room_type, accommodates, bathrooms_text, bedrooms, beds, amenities, price, minimum_nights, maximum_nights))



