%% Calculates integral for a given set using Trapezoidal Rule 
function I = trapezoidalRule (x,y)
n=length(x);    
a=x(1);         
b=x(n);
w =(b-a)/(n-1);  % Interval Width - dividing the interval into equal steps
sum=0;
%% Calculating the summation of intermediate points
for i=2:n-1
    sum=sum+y(i);
end
%% Calculating the total area of all trapezoids "Multiple Trapezoidal Rule"
I = (w/2)*(y(1)+2*sum+y(n));
end
