
l = 30
time <- mean((-l)*log(1-runif(1000)))

n <- 1000
wait<-NULL
for (i in 1:n)
{
  person <- 60*runif(1)
  bus <- 60*runif(1)
  
  while(bus < person)
  {
    bus <- bus + 60*runif(1);
  }
  wait <- c(wait,bus - person);
}

mean(wait)