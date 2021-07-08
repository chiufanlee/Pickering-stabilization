function y=Mutant_OtoE(T,D,a,R)


%T= simulation time in seconds
%R=vector of drops' radii
%D=10
%a=.96
%gf=0.15


dt=1e-3;
L=ceil(T/dt);
Ntot=length(R);
R=R*1000;
DV=4*pi/3*sum(R.^3);
Rc=mean(R);
gL=15;

V=30e13;
cin=20;
cout1=1;
cout2=1;
cinf=mean(gL./R)+1;
cinf=a*cinf;
ctot=(V-DV)*cinf+cin*DV;
M=200;
y=zeros(M,Ntot+1);
y(1,1)=0;
y(1,2:Ntot+1)=R';
freq=floor(L/M);
s=2;
time=0;
flag=0;
D0=D+D*(2*rand(Ntot,1)-1)/2;
DV0=DV;

for k=1:L    
    time=time+dt;
    DV=4*pi/3*sum(R.^3);
    cinf=(ctot-cin*DV)/(V-DV);
    e1=cinf/cout1-1;
    e2=cinf/cout2-1;
    for k2=1:Ntot
        D2=D0(k2);
        if R(k2)>1    
            R(k2)=R(k2)+D2*dt*(e1-gL./R(k2));
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

    