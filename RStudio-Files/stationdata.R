library(jsonlite)
library(dplyr)

# url of Open Toronto station information API endpoint
url0 <- "https://tor.publicbikesystem.net/ube/gbfs/v1/en/station_information"

# Retrieve JSON from the endpoint
theJSON <- fromJSON(url0)

# Parse JSON response to get the data
mydata <- theJSON[["data"]]

mydata

# Extract station information and put into a dataframe
stationDF <- mydata[["stations"]]

stationDF

# Save dataframe as RDA object if needed
# save(stationDF, file = 'bikestation-data.rda')


#define column names to be excluded as a list
cols <- names(stationDF) %in% c('rental_methods', 'groups')

# Removing undesired columns (from the above list)
clean <- stationDF[!cols]

# Printing dataframe to make sure correct columns appear
clean

#save as csv
write.csv(clean, "torontobikestation-data.csv", row.names=FALSE)
