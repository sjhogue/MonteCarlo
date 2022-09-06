AWin = NULL;
n = 10000;

for (i in 1:n)
{
	ACash <- -5;
	coin <- sample(c('h','t'),1);
	while (coin != 't')
	{		
		ACash <- ACash + 1;
		coin <- sample(c('h','t'),1);
	}

	AWin <- c(AWin,ACash);
}

ACash <- 0;
for (i in 2:n)
{
  ACash <- c(ACash,ACash[i-1]+AWin[i])
}
#png('AWin100.png')
#hist(AWin)
#dev.off()

png('ACash10000.png')
plot(ACash)
dev.off()
