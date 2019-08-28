
# Simulation exercises solutions


# 1.

# Note: sum() is used for addition over elements of a vector

# n = # samples
n = 10000

# Note: take standard Normal draws with rnorm(n, mean = 0, sd = 1)
x = rnorm(n)

# estimated expected value is just the mean


# compute the expected value of the two quantities in general



# 2. 
sim = replicate(1000, {
n = 100000

# cut it into three pieces
x = runif(n)
y = runif(n)

xnew = x
ynew = y

xnew[y < x] = y[y < x]
ynew[y < x] = x[y < x]

s1 = xnew
s2 = ynew - xnew

s3 = 1 - ynew

t1 = s1 <= s2 + s3 
t2 = s2 <= s1 + s3
t3 = s3 <= s1 + s2

sum(t1 & t2 & t3) / n 

})

hist(sim)

