
#Read in the data
df<-read.csv("companydata.csv")

#We can start by fitting the model with all available regressors
fit1<-lm(y~.,df)

#Using the pairs function, we can see a strong relationship between y and x1, y and x2, and x1 and x2 

pairs(~y+x1+x2+x3,data=df)

#We can confirm this relationship between x1 and x2 numerically by showing how highly correlated they are
cor(df$x1,df$x2)

#x1 doesn't seem to contribute much more new informatino to our regression, and x3 seems to have no
#relationship to the other variables, so let's rerun our regression with x2 only

fit2<-lm(y~x2,df)
summary(fit2)

#The intercept term here is highly insignificant, so let's construct one more linear model without it
fit3<-lm(y~x2 - 1, data=df)
summary(fit3)

#Judging from the reductions in R^2 value, fit3 seems to be the strongest of these models