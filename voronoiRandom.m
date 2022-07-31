clc
clear all
close all
%filename = 'Voronoi_Pit.gif';
n = 1000;
x = rand([1 n])*10-5;
y = rand([1 n])*10-5;

px = 0;
py = 0;

g = zeros(2,n);
angs = zeros(1,n);
dists = zeros(1,n);
dt = 0.1;
for k = 1:2000
    figure(1)
    voronoiMeshing([x 0], [y 0],'b')
    set(gca,'XTick',[], 'YTick', [])
    xlim([-2.5 2.5])
    ylim([-2.5 2.5])
    %x = x - g*(i/50)^2/2;
    %g = 1./((y-0.5));
    for m = 1:n
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
    end
    y = y + g(2,:)*1.6*dt^2/2;
    x = x + g(1,:)*1.6*dt^2/2;
    set(gcf, 'Position',  [500, 200, 1000, 800])

    %{
    frame = getframe(h); 
    im = frame2im(frame); 
    [imind,cm] = rgb2ind(im,256); 
    % Write to the GIF File 
    if k == 1 
        imwrite(imind,cm,filename,'gif', 'Loopcount',inf,'DelayTime',0.001); 
    else 
        imwrite(imind,cm,filename,'gif','WriteMode','append','DelayTime',0.001); 
    end 
    %}
end