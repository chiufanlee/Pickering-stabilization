function M=make_movie_OtoE(yW)

%yW = input file of the temporal evolution of condensates' radii

v = VideoWriter('Mutant_OtoE_s3.avi');
open(v);
N=100; % Number of frames
yW=yW';
L=length(yW(1,:));
LA=L/2;
LP=L/2;
LA 

DL=random_locations(LA,LP);
for i = 1:N
    n=i*2;
    draw_fig(yW(n,:)/1000,DL,LA,LP);
    frame = getframe(gcf);
    writeVideo(v,frame);
end
close(v);
M=1;