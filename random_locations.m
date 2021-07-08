function y=random_locations(LA,LP)

N=100;
x=0:.1:10;
x=fliplr(x);
r1=sqrt(100-x.^2);
x=0:.1:10;
r3=10*ones(1,200);
r2=sqrt(100-x.^2);
r=[r1 r3 r2];
L=length(r);


A1=10^2*pi*10;
A2=4*pi*10^3/6;
[x,y,z] = sphere;
y=zeros(LA+LP,3);
c1=1;
DL=zeros(LA,3);
c=1;
for k=1:LA
    a=(A1+A2)*rand;    
    if a<A1
        Z=10*rand+10;
        R=9*rand;
        the=2*pi*rand;        
        DL(k,1)=R*cos(the);
        DL(k,2)=Z;
        DL(k,3)=R*sin(the);
    else        
        R=9*rand;
        the=pi*rand+pi;
        phi=pi*rand;
        x0=R*sin(phi)*cos(the);
        y0=R*sin(phi)*sin(the);
        z0=R*cos(phi);             
        if the>pi            
            DL(k,1)=x0;
            DL(k,2)=y0+10;
            DL(k,3)=z0;
        else
            DL(k,1)=x0;
            DL(k,2)=y0+30;
            DL(k,3)=z0;
        end       
    end
end
c=1;
y=DL;

DL=zeros(LP,3);
for k=1:LP
    a=(A1+A2)*rand;    
    if a<A1
        Z=10*rand+20;
        R=9*rand;
        the=2*pi*rand;        
        DL(k,1)=R*cos(the);
        DL(k,2)=Z;
        DL(k,3)=R*sin(the);
    else        
        R=9*rand;
        the=pi*rand;
        phi=pi*rand;
        x0=R*sin(phi)*cos(the);
        y0=R*sin(phi)*sin(the);
        z0=R*cos(phi);             
        if the>pi            
            DL(k,1)=x0;
            DL(k,2)=y0+10;
            DL(k,3)=z0;
        else
            DL(k,1)=x0;
            DL(k,2)=y0+30;
            DL(k,3)=z0;
        end       
    end
end
y=[y; DL];


