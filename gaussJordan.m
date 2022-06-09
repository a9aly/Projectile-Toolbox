%% Gauss jordan solve for x in "ax=b"
function x=gaussJordan(a,b)
%% Get no. of rows
n= length(b);
for k=1:n
    %% Apply partial pivoting
    %  Search for the row with the largest coefficient in column "k"
    %  store row number in pivot%%
    pivot=k;
    big=abs(a(k,k));
    for ii=k+1:n
        dummy= abs(a(ii,k));
        if (dummy > big)
            big=dummy;
            pivot=ii;
        end
    end
    
    %% Swapping elements of wrong "pivot" row and "k" row%%
    if (pivot~=k)
        for jj=k:n
            dummy=a(pivot,jj);
            a(pivot,jj)=a(k,jj);
            a(k,jj)=dummy;
        end
        dummy=b(pivot);
        b(pivot)=b(k);
        b(k)=dummy;
    end
    
    %% Normalizing pivot row with pivot coefficient
    dummy= a(k,k);
    for j=k:n
        a(k,j)= a(k,j)/dummy;
    end
    b(k)=b(k)/dummy;
    
    %% Modifying coefficients above and below pivot coefficient
    %  the element in the row above or lower to the pivot is set to zero
    %  other elements in the same row are subtracted by:
    %  the value in the pivot column in the same row
    %  multiplied by the value in the column above the currently being
    %  modified element
    for i=1:n
        if (i~=k)
            dummy= a(i,k);
            a(i,k)=0;
            for j=k+1:n
                a(i,j)= a(i,j)-dummy*a(k,j);
            end
            b(i)=b(i)-dummy*b(k);
        end
    end
end
x=b;
end
