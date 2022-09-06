N <- 100
f <- c(0,1,2,3,4,5,6,5,4,3,2,1)

d <- rep(0,N)

d[1] <- 5

for (i in 2:N){
  u <- runif(1)
  
  if (d[i-1]==2){
    if (u<.5) d[i] <- d[i-1]+1
    else d[i] <- d[i-1]
  }
  
  else if (d[i-1]==12){
    if (u<.5) d[i] <- d[i-1]
    else d[i] <- d[i-1]-1
  }
  
  else{
    if (u<.5) d[i] <- d[i-1]+1
    else d[i] <- d[i-1]-1
  }
  
  h <- min(1,f[d[i]]/f[d[i-1]])
  u <- runif(1)
  if (u>h) d[i] <- d[i-1]
}

#print(d)
#hist(d)
plot(d[1:(N-1)],d[2:N])
d <- rep(0,N)
#runtime2 <- system.time(
for (i in 2:N){

  d[i] <- sample(2:12,1)
  
  h <- min(1,f[d[i]]/f[d[i-1]])
  u <- runif(1)
  if (u>h) d[i] <- d[i-1]
}
plot(d[1:(N-1)],d[2:N])
#)
#hist(d)
runtime1
runtime2