# Load merged data 
#load("./gen/data-preparation/src/data-preparation/listings_joined.csv")

# Missing values
## Beds: remove 274 NA's
listings_joined <- listings_joined %>% filter(!is.na(listings_joined$beds))

## Bedrooms: NA's -> 0 (studio)
listings_joined <- listings_joined %>% 
  mutate(bedrooms = ifelse(is.na(bedrooms), 0, bedrooms))

# Bathrooms: remove 9 NA's
listings_joined <- listings_joined %>% filter(!is.na(listings_joined$bathrooms_text))
  
# Check NA's for characters
  
  
# Mutate columns
## Bathrooms
### private / shared
listings_joined <- listings_joined %>% 
  mutate(bathroom_shared = ifelse(grepl("shared", bathrooms_text, ignore.case = TRUE), "shared", "private"))

## room_type
### private / shared
listings_joined <- listings_joined %>% 
  mutate(room_shared = ifelse(grepl("shared", room_type, ignore.case = TRUE), "shared", "private"))

View(listings_joined)

## Character -> numeric
### Bathrooms
glimpse(listings_joined$bathrooms_text)
unique(listings_joined$bathrooms_text)
unique(listings_joined$room_type)

## Amenities



# Save cleaned data
save(df_cleaned,file="./gen/data-preparation/output/data_cleaned.RData")
