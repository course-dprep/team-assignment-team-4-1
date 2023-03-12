## Join the listings tibble with listings_sorted to add the listing_type column
listings_joined <- listings %>%
  left_join(listings_sorted, by = c("listing_id" = "id"))

## Save dataframe
# assume listings_sorted is a dataframe
write.csv(listings_joined, "listings_joined.csv", row.names = FALSE)

