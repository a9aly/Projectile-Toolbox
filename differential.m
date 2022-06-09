% The used  numerical differentiation could be O(h^2) or O(h^4) methods
% based of chosen "method". 
function vx = differential(t,x,method)
n = length(t);   %number of points
h = t(2) - t (1); %step
%% Apply forward and backward Methods to get first and last points with O(h^2)
vx(1) = (-x(3)+4*x(2)-3*x(1))/(2*h);
vx(n) = (3*x(n)-4*x(n-1)+x(n-2))/(2*h); 

%% Apply Center difference Method O(h^2)
vx(2)=(x(3)-x(1))/(2*h);     
vx(n-1)=(x(n)-x(n-2))/(2*h);      

%% Apply Center difference Method O(h^4)
if(method == 2)
    for i=3:n-2
            vx(i)=(x(i+1)-x(i-1))/(2*h);      
    end
    elseif method==4   
        for i=3:n-2
            vx(i)=(-x(i+2)+8*x(i+1)-8*x(i-1)+x(i-2))/(12*h);     
        end
end
end