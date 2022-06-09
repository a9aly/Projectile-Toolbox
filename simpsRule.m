%% Calculates integral for a given set using simpson 1/3 Rule 
function I = simpsRule(x,y)
n=length(x);    
a=x(1);         
b=x(n);
w =(b-a)/(n-1);  % Interval Width - dividing the interval into equal steps
evenSum=0;
oddSum=0;
%% Since Matlab indices starts with one not zero, even will start from 3 and odd starts from 2
%% Add even sets
for i=3:2:n-2
    evenSum=evenSum+y(i);
end
%% Add odd sets
for i=2:2:n-1
    oddSum=oddSum+y(i);
end
I = (w/3)*(y(1)+4*oddSum+2*evenSum+y(n));
end
