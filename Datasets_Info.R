# There are 6 different data sets available on inside Airbnb for the city Barcelone
# - calendar.csv
# - listings.csv
# - listings-2.csv
# - reviews.csv
# - reviews-2.csv
# - neighbourhoods.csv

#the datasets that are most important for this research purpose are: calendar.csv, listings.csv and listings-2.csv

#relevant columns per dataset are:
#calendar.csv
# - id
# - neighbourhood_group
# - room_type
# - minimum_nights
# - maximum_nigts
# - price(?)

#listings.csv
# - id
# - neighbourhood_group
# - room_type
# - minimum_nights
# - calculated_host_listing_count
# - neigbourhood
# - price
# - number_of_reviews
# - availability_365
# _ license 

#listings.csv-2
# - id
# - listing_url
# - neighbourhood
# - property_type
# - room_type
# - accommodates
# - bathrooms_text
# - bedrooms
# - beds
# - amenities
# - price
# - minimum_nights
# - maximum_nights
# - number_of_reviews
# - review_scores_rating

# optional:
#   - host_response_time
# - host_response_rate
# - host_is_superhost
# - host_listings_count
# - host_total_listings_count
# - host_verifications
# - host_identity_verified
# - review_scores_cleanliness"                   
# - review_scores_checkin"                       
# - review_scores_communication"                 
# - review_scores_location"                      
# - review_scores_value" 

#set-up
library(tidyverse)

##opening dataset calendar.csv
calendar <- read_csv('calendar.csv')
#7 columns 5,758,490 rows 
#[1] "listing_id"     "date"           "available"      "price"         
#[5] "adjusted_price" "minimum_nights" "maximum_nights"


max(calendar$date)
#"2023-12-11"
min(calendar$date)
"2022-12-11"
min(calendar$minimum_nights, na.rm  = TRUE)
#1 night
max(calendar$maximum_nights, na.rm = TRUE)
#2147483647 --> 728 rows with this high number

#for 5,429,042 airbnb's the price and the adjusted_price is the same.

calendar %>% arrange(desc(price))
#highest price $999.00
calendar %>% arrange(price)
#lowest price $1,000.00 (does not seem correct)


##opening dataset listings.csv
listings <- read_csv('listings.csv')
#The dataset listings is more general information about the airbnb

#18 columns
# [1] "id"                             "name"                          
# [3] "host_id"                        "host_name"                     
# [5] "neighbourhood_group"            "neighbourhood"                 
# [7] "latitude"                       "longitude"                     
# [9] "room_type"                      "price"                         
# [11] "minimum_nights"                 "number_of_reviews"             
# [13] "last_review"                    "reviews_per_month"             
# [15] "calculated_host_listings_count" "availability_365"              
# [17] "number_of_reviews_ltm"          "license"    

# 15778 rows

#price highest $90.000
listings %>% arrange(desc(price))

# price lowest $0 ? (questionable)
listings %>% arrange(price)


##opening dataset listings-2.csv
#as compared to listings this dataset listings2 contains more information about what type of accomodation and facilities
listings2 <- read_csv('listings-2.csv')

ncol(listings2)
#75 columns

#same number rows as the listings dataset
# [1] "id"                                          
# [2] "listing_url"                                 
# [3] "scrape_id"                                   
# [4] "last_scraped"                                
# [5] "source"                                      
# [6] "name"                                        
# [7] "description"                                 
# [8] "neighborhood_overview"                       
# [9] "picture_url"                                 
# [10] "host_id"                                     
# [11] "host_url"                                    
# [12] "host_name"                                   
# [13] "host_since"                                  
# [14] "host_location"                               
# [15] "host_about"                                  
# [16] "host_response_time"                          
# [17] "host_response_rate"                          
# [18] "host_acceptance_rate"                        
# [19] "host_is_superhost"                           
# [20] "host_thumbnail_url"                          
# [21] "host_picture_url"                            
# [22] "host_neighbourhood"                          
# [23] "host_listings_count"                         
# [24] "host_total_listings_count"                   
# [25] "host_verifications"                          
# [26] "host_has_profile_pic"                        
# [27] "host_identity_verified"                      
# [28] "neighbourhood"                               
# [29] "neighbourhood_cleansed"                      
# [30] "neighbourhood_group_cleansed"                
# [31] "latitude"                                    
# [32] "longitude"                                   
# [33] "property_type"                               
# [34] "room_type"                                   
# [35] "accommodates"                                
# [36] "bathrooms"                                   
# [37] "bathrooms_text"                              
# [38] "bedrooms"                                    
# [39] "beds"                                        
# [40] "amenities"                                   
# [41] "price"                                       
# [42] "minimum_nights"                              
# [43] "maximum_nights"                              
# [44] "minimum_minimum_nights"                      
# [45] "maximum_minimum_nights"                      
# [46] "minimum_maximum_nights"                      
# [47] "maximum_maximum_nights"                      
# [48] "minimum_nights_avg_ntm"                      
# [49] "maximum_nights_avg_ntm"                      
# [50] "calendar_updated"                            
# [51] "has_availability"                            
# [52] "availability_30"                             
# [53] "availability_60"                             
# [54] "availability_90"                             
# [55] "availability_365"                            
# [56] "calendar_last_scraped"                       
# [57] "number_of_reviews"                           
# [58] "number_of_reviews_ltm"                       
# [59] "number_of_reviews_l30d"                      
# [60] "first_review"                                
# [61] "last_review"                                 
# [62] "review_scores_rating"                        
# [63] "review_scores_accuracy"                      
# [64] "review_scores_cleanliness"                   
# [65] "review_scores_checkin"                       
# [66] "review_scores_communication"                 
# [67] "review_scores_location"                      
# [68] "review_scores_value"                         
# [69] "license"                                     
# [70] "instant_bookable"                            
# [71] "calculated_host_listings_count"              
# [72] "calculated_host_listings_count_entire_homes" 
# [73] "calculated_host_listings_count_private_rooms"
# [74] "calculated_host_listings_count_shared_rooms" 
# [75] "reviews_per_month"    

##opening dataset neighbourhoods.csv
#this dataset comes in handy for finding in which nighbourhoodgroup a certain neighbourhood lies
neighbourhoods <- read_csv('neighbourhoods.csv')


#73 observations 
ncol(neighbourhoods)
#2 columns
#neighbourhood_group and neighbourhood
#10 different neighbourhood_groups
#73 neighbourhoods


##opening dataset reviews.csv
#not really important for our research project
reviews <- read_csv('reviews.csv')

#669754 observations all reviews that were written for a particular listing_id

ncol(reviews)
#2 columns
colnames(reviews)
# "listing_id" "date"
#so only the date and for which property (listing_id) there was made a review

##opening dataset reviews-2.csv
#contains also the reviews that people wrote, however also not really interesting for our research project
reviews2 <- read_csv('reviews-2.csv')
#669754 observations
#6 columns
colnames(reviews2)
# [1] "listing_id"    "id"            "date"          "reviewer_id"  
# [5] "reviewer_name" "comments"  




