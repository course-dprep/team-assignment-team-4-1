#load("./gen/data-preparation/src/data-preparation/listing_type.csv")
#load("./gen/data-preparation/src/data-preparation/listings_sorted.csv")

## Join the listings tibble with listings_sorted to add the listing_type column
listings_joined <- listings_sorted %>%
  left_join(listing_type, by = c("id" = "listing_id"))

test <- inner_join(listings_sorted, listing_type, by = c("id" = "listing_id"))
View(test)

## Save dataframe
# assume listings_sorted is a dataframe
write.csv(listings_joined, "listings_joined.csv", row.names = FALSE)

length(unique(listings_sorted$id))
length(unique(listing_type$listing_id))
length(unique(calendar$listing_id))
