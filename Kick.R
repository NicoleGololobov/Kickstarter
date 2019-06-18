# Read data into pandas dataframe
kick_data = read.csv("/Users/Nicole/Documents/Kickstarter/Kickstarter002.csv")

# remove live entries as their final state is unknown
kick_data = kick_data[!(kick_data$state=="live"),]



