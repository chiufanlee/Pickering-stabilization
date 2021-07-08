function y=WT_polarization(T,D,a,A,P,gL2)

%T= simulation time in seconds
%A=vector of anterior drops' radii
%P=vector of posterior drops' radii
%gf=0.15
%D=12;
%a=1.2;

dt=1e-3;
L=ceil(T/dt);
N1=length(A);
N2=length(P);
A=A*1e3;
P=P*1e3;
Ntot=N1+N2;
R=[A; P];
DV=4*pi/3*sum(R.^3);
Rc=mean(R);
gL=15;
coverage=.2;
V=30e13;
cin=20;
cout1=1.2;
cout2=1;
cinf=mean([gL./R(1:N1); gL2./R(N1+1:Ntot)])+1;
cinf=cinf*a;
ctot=(V-DV)*cinf+cin*DV;
M=200;
y=zeros(M,Ntot+1);
y(1,1)=0;
y(1,2:Ntot+1)=R';
freq=floor(L/M);
s=2;
time=0;
flag=0;
D0=D+2*D/3*(2*rand(Ntot,1)-1);

for k=1:L    
    time=time+dt;
    DV=4*pi/3*sum(R.^3);
    cinf=(ctot-cin*DV)/(V-DV);
    e1=cinf/cout1-1;
    e2=cinf/cout2-1;
    for k2=1:Ntot
        D2=D0(k2)*coverage;
        if k2<=N1 & R(k2)>1    
            R(k2)=R(k2)+D0(k2)*dt*(e1-gL./R(k2));
            if R(k2)<1
                R(k2)=1;
            end     
        elseif  R(k2)>1
            R(k2)=R(k2)+D2*dt*(e2-gL2/R(k2));
            if R(k2)<1
                R(k2)=1;
            end                   
        end
    end    
    if k >= s*freq 
        rm=mean(R(1:Ntot));
        [s Ntot mean(R(1:Ntot))];
        y(s,:)=[time R'];
        s=s+1;
    end    
end
