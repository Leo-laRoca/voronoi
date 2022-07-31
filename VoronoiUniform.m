clc
clear all
close all

n = 35;
[x,y] = meshgrid(-5:10/n:5,-5:10/n:5);
x = x(:)';
y = y(:)';
nn = length(x);

px = 0;
py = 0;

g = zeros(2,nn);
angs = zeros(1,nn);
dists = zeros(1,nn);
dt = 0.1;


for k = 1:2000
    voronoiMeshing(x, y, 'b');
    set(gca,'XTick',[], 'YTick', [])
    xlim([-2.5 2.5])
    ylim([-2.5 2.5])
    pause(0.001)
    %x = x - g*(i/50)^2/2;
    %g = 1./((y-0.5));
    for m = 1:nn
        %angs(m) = atan((x(m)-px)/(y(m)-py));
        angs(m) = atan2(y(m), x(m));
        dists(m) = sqrt((x(m)-px)^2 + (y(m)-py)^2);
        %x direction gravity
        g(1,m) = -cos(angs(m))*1/(dists(m)^2);
        %y direction gravity
        g(2,m) = -sin(angs(m))*1/(dists(m)^2);
        %Gravit limit
        %{
        limit = 2000000;
        if g(1,m) <0 && g(1,m) < limit
            g(1,m) = -limit;
        elseif g(1,m) > 0 && g(1,m) > limit
            g(1,m) = limit;
        end 
        if g(2,m) <0 && g(2,m) < limit
            g(2,m) = -limit;
        elseif g(2,m) > 0 && g(2,m) > limit
            g(2,m) = limit;
        end 
        %}
        if abs(y(m)) < 0.0001 || abs(x(m)) < 0.0001
            g(1,m) = 0;
            g(2,m) = 0;
        end
    end
    y = y + g(2,:)*1.6*dt^2/2;
    x = x + g(1,:)*1.6*dt^2/2;
    
    
    set(gcf, 'Position',  [500, 200, 1000, 800])


end