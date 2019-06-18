# Read data into pandas dataframe
kick_data = read.csv("/Users/Nicole/Documents/Kickstarter/Kickstarter002.csv")

# remove live entries as their final state is unknown
kick_data = kick_data[!(kick_data$state=="live"),]

kick_data$category<-as.factor(kick_data$category)
kick_data$country<-as.factor(kick_data$country)

# 75% of rows for training data
samp_size = floor(0.75 * nrow(kick_data))
samp = sample(seq_len(nrow(kick_data)), size = samp_size)
train = kick_data[samp,]
test = kick_data[-samp, ]