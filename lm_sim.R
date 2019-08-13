
# R code                    # Pseudo-code

x <- seq(-5, 5, 0.5)        # Produce a range of inputs X
sigma <- 2.4                # set standard deviation of response Y
alpha <- 5                  # set regression parameters
beta1 <- 1.98
                            # Sample y's
y <- rnorm(length(x), mean = alpha + beta1*x, sd = sigma)
plot(x=x, y=y)              # plot x, y
lm1 <- lm(y~x)              # add a linear model
plot(lm1, add = TRUE)       # overlay plot




































