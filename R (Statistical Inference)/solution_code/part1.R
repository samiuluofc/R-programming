
library(ggplot2)

lambda <- 0.2
num_obs <- 40

# Theoratical mean, std-dev and SE of exp distribution
theo_mean <- round(1/lambda,4)
theo_stddev <- round(1/lambda,4)
theo_SE <- round((1/lambda)/sqrt(num_obs),4)


# Initialization of simulation
sim_mean = NULL
sim_std = NULL
num_of_simulation = 1000

# Simulation iterations
for (i in 1 : num_of_simulation)
{
      val <- rexp(num_obs, lambda)
      sim_mean = c(sim_mean, mean(val))
      sim_std = c(sim_std, sd(val))
}

# Exploratory statistics of distribution of the 1000 means
mean_of_means = mean(sim_mean)
SE_of_means = sd(sim_mean)

# Plotting of distribution of the 1000 means
png("g1.png",  width=700, height=480)
g <- ggplot(data.frame(sim_mean), aes(x = sim_mean))
g <- g + geom_histogram(fill = "salmon", binwidth = 0.1, aes(y = ..density..), color = "black")
g <- g + geom_density(size = 1.5)
g <- g + geom_vline(xintercept = mean_of_means, size = 1, color = "yellow")
g <- g + labs(title = paste('Sample mean = ', round(mean_of_means,4), ', Theoratical mean = ', theo_mean, ', Sample SE = ', round(SE_of_means,4), ', Theoratical SE = ', theo_SE))
g <- g + xlab("Distribution of means of 40 exponentials (after 1000 simulations)")
g <- g + ylab("Density")
print(g)
dev.off()


# Exploratory statistics of distribution of the 1000 std-devs
mean_of_stds = mean(sim_std)

# Plotting of distribution of the 1000 std-devs
png("g2.png",  width=700, height=480)
g <- ggplot(data.frame(sim_std), aes(x = sim_std))
g <- g + geom_histogram(fill = "gray", binwidth = 0.2, aes(y = ..density..), color = "black")
g <- g + geom_density(size = 1.5)
g <- g + geom_vline(xintercept = mean_of_stds, size = 1, color = "red")
g <- g + labs(title = paste('Sample std-dev (average of all std-dev) = ', round(mean_of_stds,4), ', Theoratical std-dev = ', theo_stddev))
g <- g + xlab("Distribution of standard-deviations of 40 exponentials (after 1000 simulations)")
g <- g + ylab("Density")
print(g)
dev.off()


# Values of 1000 random exponentials 
sim_exp = rexp(1000, lambda)
mean_of_exp = mean(sim_exp)

# Plotting of distribution of 1000 random exponential values
png("g3.png",  width=700, height=480)
g <- ggplot(data.frame(sim_exp), aes(x = sim_exp))
g <- g + geom_histogram(fill = "cyan", binwidth = 0.5, aes(y = ..density..), color = "black")
g <- g + geom_density(size = 1)
g <- g + geom_vline(xintercept = mean_of_exp, size = 1, color = "red")
g <- g + labs(title = paste('Mean = ', round(mean_of_exp,4)))
g <- g + xlab("Distribution of a 1000 random exponentials values")
g <- g + ylab("Density")
print(g)
dev.off()

