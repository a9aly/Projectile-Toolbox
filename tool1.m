function tool1(x,y,n)
%% Taking Data from user
disp ("Hi, this is tool 1 in projectile toolbox");
disp ("Tool 1 computes the total length of the path of the projectile in meters");
%% Derive quadratic splines to each interval
equationsCoefficients=splines(x,y); % Call function to compute splines
intervals=zeros(n-1,3); % Will Carry splines quadratic equations
k=1;    % Loop through coefficients array
for i=1:n-1
    for j=1:3
        intervals(i,j)=equationsCoefficients(k);   %each row carries ai,bi,ci
        k=k+1;
    end
end
%% Make x intervals of equal width to be able to integrate using methods available
newXn=1000; %number of intervals
newX=linspace(x(1),x(n),newXn); %make an interval of 1000 equal spaced intervals between x0 and xn
newY=zeros(1,newXn);
%% Subsitute x in (quadratic equations) and get dy/dx 
ydash=zeros(1,newXn);
k=1;    % Loop inside quadratic equations
for i=1:newXn
    if(newX(i)<x(k+1))  %check if the value of newx is more than than the current x value representing end of an interval for spline equation
        newY(i)=intervals(k,1)*newX(i)^2+intervals(k,2)*newX(i)+intervals(k,3); %compute equivalent y values by subsituting in the equation of a_k*x^2+b_k*x+c
        ydash(i)=2*intervals(k,1)*newX(i)+intervals(k,2); %compute equivalent y dash by subsituting in the equation of 2*a_k*x+b_k
    else
        if(i~=newXn)    %if the value of newx is more than the current x we move to the next spline interval
            k=k+1;      
        end
        newY(i)=intervals(k,1)*newX(i)^2+intervals(k,2)*newX(i)+intervals(k,3);%compute equivalent y values by subsituting in the equation of a_k*x^2+b_k*x+c
        ydash(i)=2*intervals(k,1)*newX(i)+intervals(k,2); %compute equivalent y dash by subsituting in the equation of 2*a_k*x+b_k
    end
end

%% Integral equation "arc length formula"
integralf = sqrt(1+ydash.^2); %sqrt(1+(dy/dx)^2)
totalLength= trapezoidalRule(newX,integralf); %integration of integralf from x0 to xn
disp("Total Length of the projectile’s path in m is: ");
disp(totalLength);