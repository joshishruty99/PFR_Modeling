%initial values
Ca0=1.42; Cb0=1.56; m= Cb0/Ca0;
Xa= linspace(0,0.91,100);
t=linspace(0,0.4,100);
A= (m-Xa)./(1-Xa);
B=log(A)
plot(t,B);
