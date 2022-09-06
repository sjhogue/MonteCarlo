P<-matrix(c(1-.5*exp(-3),.5*exp(-3),0,0,.5,0,.5,0,0,.5*exp(-1),.5-.5*exp(-1),.5,0,0,.5*exp(-1),1-.5*exp(-1)),nrow=4,byrow=TRUE)

N <- 1000
dAvg <- NULL
for (j in 1:1000){
d <- rep(0,N)
d[1] <- sample(1:4,1)
for (i in 2:N){
  u <- runif(1)
  
  if (d[i-1]==1){
    if (u<P[1]) d[i] <- d[i-1]
    else d[i] <- 2
  }
  
  else if (d[i-1]==2){
    if (u<.5) d[i] <- 1
    else d[i] <- 3
  }
  
  else if (d[i-1]==3){
    if (u<P[10]) d[i] <- 2
    else if (u<(P[10]+P[11])) d[i] <- 3
    else d[i] <- 4
  }
  
  else{
    if (u<P[15]) d[i] <- 3
    else d[i] <- d[i-1]
  }
  
  #h <- min(1,f[d[i]]/f[d[i-1]])
  #u <- runif(1)
  #if (u>h) d[i] <- d[i-1]
}
dAvg <- c(dAvg,d)
}
hist(dAvg,freq=FALSE,breaks=c(.5,1.5,2.5,3.5,4.5))

n<-10000

k<-matrix(rep(0,n*4),nrow=n,byrow=TRUE)
k[1,1:4]<-c(1,0,0,0)

#looks at probability density... after one step it shows the probility of being in that state
for (i in 2:n){
  k[i,1:4]<-(k[i-1,1]*P[1,1:4]+
    k[i-1,2]*P[2,1:4]+
    k[i-1,3]*P[3,1:4]+
    k[i-1,4]*P[4,1:4])
}
tail(k)
