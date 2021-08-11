%initial values 
Fa0= 39.60*10^-3;
Xa0=0;
Ca0=0.361;
v0=(35.452)*10^-3;
Cb0=0.403;
m=Cb0/Ca0;
A0=[Fa0,Xa0,Ca0];
V=linspace(0,1.73*10^-3,100);
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
tau=1.73*10^-3/v0 ;
display("Residence time for PFR 2 is "+ tau +" hours");
display("Conversion for PFR 2 is "+ max(A(:,2)));
display("volume for PFR 2 is "+ 1.73*10^-3  +" litres");

%function
function dAdV= myodefun(V,A)
Ca0=0.361;
Cb0=0.403;
m=Cb0/Ca0;
k1=2732.3;
Fa0= 39.60*10^-3;
v0=(109.535)*10^-3;
Fa=A(1);
Xa=A(2);
Ca=A(3);
dFadV= -k1*(Ca0*Ca0*(1-Xa)*(m-Xa));
dXadV= k1*(Ca0*Ca0*(1-Xa)*(m-Xa))/Fa0;
dCadV= -k1*(Ca0*Ca0*(1-Xa)*(m-Xa))/v0;
dAdV=[dFadV;dXadV;dCadV];
end