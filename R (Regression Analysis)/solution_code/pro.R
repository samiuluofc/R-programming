help(mtcars)
data(mtcars)

# Exploratory analysis
dim(mtcars)
mtcars$am <- factor(mtcars$am)
summary(mtcars)



# Scatter plot of mpg and wt variable 
with(mtcars, plot(mpg, am))
bin0 <- (mtcars[,"am"] == 0)
bin1 <- (mtcars[,"am"] == 1)
mean(mtcars[bin0,"mpg"])
mean(mtcars[bin1,"mpg"])
t.test(mtcars[bin1,"mpg"], mtcars[bin0,"mpg"])$conf


fit1 <- lm(mpg ~ cyl, data = mtcars)
fit2 <- lm(mpg ~ cyl + disp, data = mtcars)
fit3 <- lm(mpg ~ cyl + disp + hp, data = mtcars)
fit4 <- lm(mpg ~ cyl + disp + hp + drat, data = mtcars)
fit5 <- lm(mpg ~ cyl + disp + hp + drat + wt, data = mtcars)
anova(fit1,fit2,fit3,fit4,fit5)

