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

#renaming listings_joined to df, makes it easier
df <- listings_joined 

df %>% filter(property_type) %>% 
  sum(property_type) 

#count the property types
df_count_propertytypes <- df %>% 
  group_by(property_type) %>% 
  summarize(n= n())

df_count_propertytypes

#check whether it contains missing values
sum(df_count_roomtype, na.rm = TRUE)

#explore the different types of room_types
df_count_roomtype <- table(df$room_type)

#check whether it contains missing values
sum(df_count_roomtype, na.rm = TRUE)

#explore the different values of accommodates
unique(df$accommodates)
table(df$accommodates)

#explore the different values of bathroom
unique(df$bathrooms)
#delete bathroom, because only NA values
df <- subset(df, select = -c(bathrooms))

#explore the different values of bathrooms_text
unique(df$bathrooms_text)
table(df$bathrooms_text)
#maybe it is an idea to create a new column with either shared/private bathroom?

#see if prices are the same 
df_price <- df %>% filter(price.x == price.y)
df_price
nrow(df_price)
#prices are not the same because they are written in another way, therefore we are able to delete 1 column
#delete column price.y
df <- subset(df, select = -c(price.y))
