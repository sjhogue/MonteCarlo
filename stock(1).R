M <- matrix(c(1-.5*exp(-3),.5*exp(-3),0,0,
              .5,0,.5,0,
              0,0.5*exp(-1),1-(0.5*exp(-1)+.5),.5,
              0,0,.5*exp(-1),1-.5*exp(-1)),nrow=4,byrow=TRUE)
M<-t(M)

n <- 20

y <- matrix(rep(0,n*4),nrow=n, byrow=TRUE)
y[1,1:4]<-c(1,0,0,0)

for (i in 2:n){
  y[i,1:4]<-(y[i-1,1]*M[1:4,1]+
               y[i-1,2]*M[1:4,2]+
               y[i-1,3]*M[1:4,3]+
               y[i-1,4]*M[1:4,4])
}

poo <- eigen(M)
str(poo)
v <- poo$vectors[1:4,1]
v <- abs(v/sum(sqrt(v^2)))


x<-rep(0,n)
x[1]<-1


stateEnd <- NULL;
start <- runif(1);
if (start<v[1])
  {state<-1
}else if (start<v[1]+v[2])
  {state<-2
}else if ((start<v[1]+v[2]+v[3]))
  {state<-3
}else state<-4

for (i in 2:10000){
  P <- runif(1)
  #if(i>3)
  #  state<-stateEnd[i-1]
  if (state==1)
  {
    if (P<.3)
      state <- 1
    else if (P < .5)
      state <- 2
    else
      state <- 3
  }else if (state==2)
  {
    if (P<.4)
      state <- 1
    else if (P < .7)
      state <- 2
    else
      state <- 3
  }else
  {
    if (P<.4)
      state <- 1
    else if (P < .8)
      state <- 2
    else
      state <- 3
  }
  stateEnd <- c(stateEnd,state)
}