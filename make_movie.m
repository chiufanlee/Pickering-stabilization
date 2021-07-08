function M=make_movie(yW,LA,LP)

%yW = input file of the temporal evolution of condensates' radii
%LA = number of anterior condensates
%LP = number of posterior condensates

v = VideoWriter('F_S2.avi');
open(v);
N=100; 

DL=random_locations(LA,LP);
for i = 1:N
    n=i*2;
    draw_fig(yW(n,:)/1000,DL,LA,LP);
    frame = getframe(gcf);
    writeVideo(v,frame);
end
close(v);
M=1;