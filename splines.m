
function equationsCoefficients = splines (x,y)
n = length(x);
a=zeros(3*(n-1),3*(n-1));
b=zeros(3*(n-1),1);
%% Rule1: Forming Quadratic Equations hetween points
j=1;    %Accessing Columns
z=1;    %Accessing Rows
for i=1:n
    a(z,j)=x(i).^2;
    a(z,j+1)=x(i);
    a(z,j+2)=1;
    if(rem(z,2)==0)
        j=j+3;
    end
    z=z+1;
    if(i~=1&&i~=n)
        a(z,j)=x(i).^2;
        a(z,j+1)=x(i);
        a(z,j+2)=1;
        if(rem(z,2)==0)
            j=j+3;
        end
        z=z+1;
    end
end

%% Rule2: Forming Quadratic Equations Derivative "Intermediate points" 
j=1;
for i=2:n-1
    a(z,j)=2*x(i);
    a(z,j+1)=1;
    a(z,j+3)=-2*x(i);
    a(z,j+4)=-1;
    j=j+3;
    z=z+1;
end
%% Rule3: a_1 = 0
a(z,1)=1;
%% Fixing y into b
b(1)=y(1);
row=2;
for i=2:n-1
    b(row)=y(i);
    b(row+1)=y(i);
    row=row+2;
end
b(row)=y(n);
%% Solving using GaussJordan
equationsCoefficients = gaussJordan(a,b);
end