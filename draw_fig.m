function y=draw_fig(WT,DL,LA,LP)

figure
N=100;
x=0:.1:10;
x=fliplr(x);
r1=sqrt(100-x.^2);
x=0:.1:10;
r3=10*ones(1,200);
r2=sqrt(100-x.^2);
r=[r1 r3 r2];
L=length(r);

[X,Y,Z]=cylinder(r,100);
hSurface=surf(X,40*Z,Y);  hold on
set(hSurface,'FaceColor',[0 .5 1], ...
      'FaceAlpha',0.2,'FaceLighting','gouraud','EdgeColor','none')
axis equal

A1=10^2*pi*10;
A2=4*pi*10^3/6;
[x,y,z] = sphere;
L=length(WT);
c=1;

for k=1:LA  
    r2=WT(c);
    x1=r2*x+DL(k,1);
    y1=r2*y+DL(k,2);
    z1=r2*z+DL(k,3);
    c=c+1;
    surf(x1,y1,z1,'FaceColor','r',...
      'FaceAlpha',0.5,'FaceLighting','gouraud','EdgeColor','none')
end

for k=1:LP  
    r2=WT(c);
    x1=r2*x+DL(c,1);
    y1=r2*y+DL(c,2);
    z1=r2*z+DL(c,3);    
    c=c+1;
    surf(x1,y1,z1,'FaceColor','b',...
      'FaceAlpha',0.5,'FaceLighting','gouraud','EdgeColor','none')    
end


view([49 20])
camlight
axis off

