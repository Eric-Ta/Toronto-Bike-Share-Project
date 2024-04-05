import pandas as pd 
  
# reading two csv files;
data1 = pd.read_csv('combined1.csv') 
data2 = pd.read_csv('latlon.csv') 
  
# using merge function on a unique identifier
output1 = pd.merge(data1, data2,  
                   on='end_station',  
                   how='left') 
  
# displaying result 
print(output1)

output1.to_csv('combined.csv', encoding='utf-8', index=False)