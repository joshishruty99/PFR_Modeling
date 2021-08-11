%initial values
t0=0;
v0=(283.17)*10^-3;
Xspan=linspace(0,0.99,100);
[X,t]=ode45(@myodefun,Xspan,t0);
plot(X,t(:,1));
xlabel("conversion");
ylabel("time in hours");
display(t);
display("The residence time for the PFR 3 is "+max(t)+" hours");
display("The volume of PFR 3 is "+ max(t)*v0+ " litres" );
%function
function dtdX= myodefun(X,t)
Ca0=0.137;
Cb0=3.082;
K=15.57;
k1=K*Cb0;
t=t(1);
dtdX= Ca0./(k1*Ca0*(1-X));
end