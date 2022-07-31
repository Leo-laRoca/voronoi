clc
clear all
close all

n = 35;
[x,y] = meshgrid(-5:10/n:5,-5:10/n:5);
x = x(:)';
y = y(:)';
nn = length(x);

px = -5;
py = 0;

g = zeros(2,n);
angs = zeros(1,n);
dists = zeros(1,n);
dt = 0.02;
for k = 1:500
    figure(1)
    voronoiMeshing([x px], [y py],'b')
    %hold on
    set(gca,'XTick',[], 'YTick', [])
    xlim([-5 5])
    ylim([-2 2])
    pause(0.01)
    %x = x - g*(i/50)^2/2;
    %g = 1./((y-0.5));
    px = px + dt;
    py = 2*sin(px);
    set(gcf, 'Position',  [500, 200, 1000, 800])

end