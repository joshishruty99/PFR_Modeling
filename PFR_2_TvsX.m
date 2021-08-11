%initial values
t0=0;
v0=(109.525)*10^-3;
Xspan=linspace(0,0.98,100);
[X,t]=ode45(@myodefun,Xspan,t0);
plot(X,t(:,1));
xlabel("conversion");
ylabel("time in hours");
display(t);
display("The residence time for the PFR 2 is "+max(t)+" hours");
display("The volume of PFR 2 is "+ max(t)*v0+ " litres" );
%function
function dtdX= myodefun(X,t)
Ca0=0.361;
Cb0=0.403;
m=Cb0/Ca0;
k1=2732.3;
t=t(1);
dtdX= Ca0./(k1*Ca0*Ca0*(1-X)*(m-X));
end