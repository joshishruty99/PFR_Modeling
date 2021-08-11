%initial values
t0=0;
v0=(29.2)*10^-3;
Xspan=linspace(0,0.91,100);
[X,t]=ode45(@myodefun,Xspan,t0);
plot(X,t(:,1));
xlabel("conversion");
ylabel("time in hours");
display(t);
display("The residence time for the PFR 1 is "+max(t)+" hours");
display("The volume of PFR 1 is "+ max(t)*v0+ " litres" );
%function
function dtdX= myodefun(X,t)
Ca0=1.49;
k1=31.41;
t=t(1);
dtdX= Ca0./(k1*Ca0*Ca0*(1-X)*(1-X));
end