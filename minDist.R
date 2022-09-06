mins <- NULL;
for (k in 1:100)
{
  minDist <- NULL;
  for (i in 2:100)
  {
    dist <- NULL;
    x <- runif(i);
    y <- runif(i);
    minTmp <- NULL;
    for (j in 1:(i-1))
    {
      dist <- sqrt((x[j]-x)^2 + (y[j]-y)^2);  
      dist <- dist[dist!=0];
      minTmp <- c(minTmp,min(dist));
      
    }
    minDist <- c(minDist,min(minTmp));
      
  }
  mins <- cbind(mins, minDist);
}
avgMin <- rowMeans(mins)
png("MinDist2.png")
plot(2:100,avgMin,xlab="N",ylab="Distance")
dev.off()