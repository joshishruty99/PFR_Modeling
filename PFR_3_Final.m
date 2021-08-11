%initial values 
Fa0= 38.82*10^-3;
Xa0=0;
Ca0=0.137;
v0=(283.17)*10^-3;

A0=[Fa0,Xa0,Ca0];
V=linspace(0,27.18*10^-3,100);
[V,A]=ode45(@myodefun,V,A0); %function call
subplot(2,2,1)
plot(V, A(:,1),"b--");
xlabel('Volume(in litre)');
ylabel("Fa(mol/h)");
subplot(2,2,2)
plot(V, A(:,2),"r");
xlabel('Volume(in litre)');
ylabel("Xa");
subplot(2,2,3)
plot(V, A(:,3),"k");
xlabel('Volume(in litre)');
ylabel("Ca(mol/litre)");
display(A);
tau=27.18*10^-3/v0 ;
display("Residence time for PFR 3 is "+ tau +" hours");
display("Conversion for PFR 3 is "+ max(A(:,2)));
display("The volume of PFR 3 is "+0.027182+" litres");

%function
function dAdV= myodefun(V,A)
Ca0=0.137;
Cb0=3.082;
K=15.57;
k1=K*Cb0;
Fa0= 38.80*10^-3;
v0=(283.17)*10^-3;
Fa=A(1);
Xa=A(2);
Ca=A(3);
dFadV= -k1*(Ca0*(1-Xa));
dXadV= k1*(Ca0*(1-Xa))/Fa0;
dCadV= -k1*(Ca0*(1-Xa))/v0;
dAdV=[dFadV;dXadV;dCadV];
end