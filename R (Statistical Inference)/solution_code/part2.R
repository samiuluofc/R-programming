# Import data
data(ToothGrowth)

# Description of the data
help(ToothGrowth)

#Summary of the data
dim(ToothGrowth)
summary(ToothGrowth$len)
summary(ToothGrowth$dose) # Unit mg/day
summary(ToothGrowth$supp)

# Histogram of the len variable
hist(ToothGrowth$len, col = "cyan", breaks = 30)
rug(ToothGrowth$len)

# Scatter plot of len and dose variable (for two groups VC and OJ) 
with(ToothGrowth, plot(len, dose, col = supp))

# Splitting into groups
vc_data = ToothGrowth[1:30,c(1,3)]
oj_data = ToothGrowth[31:60,c(1,3)]
g1 = vc_data[,1]
g2 = oj_data[,1]

# 95% T confidence interval
t.test(g2,g1, paired = FALSE, var.equal = TRUE)$conf



