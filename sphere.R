r = 1;
dim = 2;
n = 100; 

x = rep(rnorm(100),dim)
splt = length(x)/dim

x1 = rnorm(n);
x2 = rnorm(n);
ptsx <- ((r^(1/dim))/sqrt(x1^2 + x2^2))*x1
ptsy <- ((r^(1/dim))/sqrt(x1^2 + x2^2))*x2