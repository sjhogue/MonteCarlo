x = 1:3
y = 1:3
t = matrix(rep(0,36),ncol=4,byrow=TRUE)
#t[i,] = ('u','d','r','l')

t[1,]=c(0,1,1,0)
t[2,]=c(0,0,1,1)
t[3,]=c(0,0,0,1)
t[4,]=c(1,0,1,0)
t[5,]=c(0,1,1,1)
t[6,]=c(0,1,0,1)
t[7,]=c(0,0,1,0)
t[8,]=c(1,0,0,1)
t[9,]=c(0,1,0,0)

M = cbind(rep(x,each=3),rep(y,3),t)

x1 = 1
y1 = 1
while (x!=3 & y!=3)
{
  options = M[which(M[,1]==x1 & M[,2]==y1),3:6]
  if (options[4]==1)
  {
    x1 <- 
  }
  else if (options)
}