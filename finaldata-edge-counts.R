# Load the dplyr package
library(dplyr)

# Read csv and filter columns
edges <- read.csv("augustNoSelfLoops.csv", header=TRUE, stringsAsFactors=FALSE)
edges
stations <- edges[,c(3,6)]

# Add a new column with counts
edges_with_counts <- stations %>%
  group_by(station_id, End.Station.Id) %>%
  mutate(count = n()) %>%
  ungroup()

# View the updated dataframe
print(edges_with_counts)

# To save dataframe as an RDA object, if needed
#save(edges_with_counts, file = 'edges_with_counts.rda')


# Remove duplicate entries
uniquetrips <- edges_with_counts %>%
  distinct()

# View the updated dataframe
print(uniquetrips)

# Save edge counts as a csv file 
write.csv(uniquetrips, "uniquetrips(augustNoSelfLoops.csv", row.names=FALSE)

