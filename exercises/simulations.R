
# -----------------------------------------------------------------------------
## Simulation practice
## Name:       
# -----------------------------------------------------------------------------

## Code your solutions to the simulation practice sheet here. 

# -----------------------------------------------------------------------------


## load packages
library(ggplot2) # install.packages("ggplot2")

## Exercise 1: Coverage of confidence intervals


## parameters
mu = 3.2
sig = 0.35
n = 15
n.sim = 100

## generate a single set of sample data
samp = rnorm(n = n, mean = mu, sd = sig)

## compute confidence interval
ci = c(mean(samp) - qnorm(0.975)*sig/sqrt(n), mean(samp) + qnorm(0.975)*sig/sqrt(n))

## repeat this process 100 times:

## computes one iteration
sim.ci = function(mu, sig, n) {
  samp = rnorm(n = n, mean = mu, sd = sig)
  xbar = mean(samp)
  c(xbar = xbar,
    lower = mean(samp) - qnorm(0.975)*sig/sqrt(n),
    upper = mean(samp) + qnorm(0.975)*sig/sqrt(n))
}

# pre-allocate matrix to avoid growing outputs
results = matrix(data = NA, nrow = 100, ncol = 3)
colnames(results) = c("xbar", "lower", "upper")

for (i in 1:n.sim) {
  results[i,] = sim.ci(mu=mu, sig=sig, n=n)
}

results


## use ggplot to visualize the results
results = as.data.frame(results)
results = results[order(results$lower),]
results$id = as.factor(1:n.sim)
ggplot(data = results) + geom_segment(aes(x=lower, y=id, xend=upper, yend=id)) + 
  geom_vline(xintercept = mu) + theme(axis.ticks.y = element_blank(),
                                      axis.text.y = element_blank())


## How many confidence intervals miss the target?

# compute the fraction of "bad" intervals

bad.lower = sum(mu < results$lower)
bad.upper = sum(mu > results$upper)

# fraction of bad to total
(bad.lower + bad.upper) / n.sim


## Play around with setting n to different values. How does coverage change?


## Replace the for loop with replicate:

for (i in 1:n.sim) {
  results[i,] = sim.ci(mu=mu, sig=sig, n=n)
}

## is equivalent to
my.sims = t(replicate(100, sim.ci(mu=mu, sig=sig, n=n)))


## Copy the code above to finish this simulation using replicate:





# Extra confidence interval examples:


# Consider a population that is normally distributed with mu = 3.84 and sigma = 1.6. 
# How reliable is the ``large'' sample 90% confidence interval when applied to samples 
# of only 4 observations? How reliable is this procedure when a sample has 12 observations? 
# To check the reliability, generate 1000 confidence intervals as in Sec. 7.3 and count the 
# ``bad fraction.'' A reliable 90% confidence interval should have a bad fraction around .10.













