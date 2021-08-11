%initial values 
Fa0= 43.52*10^-3;
Xa0=0;
Ca0=1.49;
v0=(29.2)*10^-3;

A0=[Fa0,Xa0,Ca0];
V=linspace(0,6.392*10^-3,100);
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
tau=6.392*10^-3/v0 ;
display("Residence time for PFR 1 is "+ tau +" hours");
display("Conversion for PFR 1 is "+ max(A(:,2)));
display("volume for PFR 1 is "+ 6.308*10^-3  +" litres");
%function
function dAdV= myodefun(V,A)
Ca0=1.49;
k1=31.41;
Fa0= (43.52)*10^-3;
v0=(29.2)*10^-3;
Fa=A(1);
Xa=A(2);
Ca=A(3);
dFadV= -k1*(Ca0*(1-Xa))^2;
dXadV= k1*(Ca0*(1-Xa))^2/Fa0;
dCadV= -k1*(Ca0*(1-Xa))^2/v0;
dAdV=[dFadV;dXadV;dCadV];
end