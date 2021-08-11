Ca0=0.38; Cb0=0.39; m= Cb0/Ca0;
Xa= linspace(0,0.98,100);
t=linspace(0,0.6,100);
A= (m-Xa)./(1-Xa);
B=log(A)
plot(t,B);