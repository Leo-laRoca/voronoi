clc
clear all
close all
n = 1000;
x = rand([1 100])*10;
y = rand([1 100])*10;

px = 5;
py = 5;

gx = zeros(1,100);
gy = zeros(1,100);


for k = 1:80
    voronoiMeshing(x,y,'b')
    %hold on
    xlim([4 6])
    ylim([4 6])
    pause(0.1)
    %x = x - g*(i/50)^2/2;
    %g = 1./((y-0.5));
    for m = 1:100
        gy(m) = 1./(sqrt(y(m)^2 - py^2));
        gx(m) = 1./(sqrt(x(m)^2 - px^2));
        if gy(m) <0 && gy(m) < 1
            gy(m) = -1;
        elseif gy(m) > 0 && gy(m) > 1
            gy(m) = 1;
        end 
        if gx(m) <0 && gx(m) < 1
            gx(m) = -1;
        elseif gx(m) > 0 && gx(m) > 1
            gx(m) = 1;
        end 
    end
    y = y - gy*0.6*(k/80)^2/2;
    x = x - gx*0.6*(k/80)^2/2;

end