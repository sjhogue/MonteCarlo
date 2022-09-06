N <- 1000
f <- c(0,1,2,3,4,5,6,5,4,3,2,1)




avg<- NULL
for(j in 1:100){
  d <- rep(0,N)
  d[1] <- sample(2:12,1)
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
avg <- c(avg,mean(d))
}

#)
#print(d)
#hist(d)
N<- 100
avg<-NULL
for(j in 1:100){
  d <- rep(0,N)
  for (i in 1:N){
    
    d[i] <- sample(2:12,1)
    
    h <- min(1,f[d[i]]/f[d[i-1]])
    u <- runif(1)
    if (u>h) d[i] <- d[i-1]
  }
  avg <- c(avg,mean(d))
}
#hist(d)
png('histN100.png')
hist(avg,xlab = "average",main="Histogram for N=100")
dev.off()

