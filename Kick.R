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

lin_model = lm(usd_pledged ~ backers_count + staff_pick + goal + country,data = train)
summary(lin_model) 
# results indicate backers_count and countryNL are significant
# adjusted R-squared = .6512

sum(kick_data$country == "NL") # returns 20, should not be included in model

lin_model2 = lm(usd_pledged ~ backers_count + staff_pick,data = train)
summary(lin_model2)
# backers_count and staff_picktrue are significant
# adjusted R-squared = .6393

par(mfrow=c(2,2))
plot(lin_model2)

# predict usd_pledged with test data
pred = predict(lin_model2, newdata = test) 
# measure root mean square error
rmse = sqrt(sum((exp(pred) - test$usd_pledged)^2)/length(test$usd_pledged))
print(rmse) # returns Inf


