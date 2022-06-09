function y = eulerMethod(h,x1,x0,y0,fx)
    NC = (x1-x0)/h;     %(number of calculation steps)
    x=x0;
    y=y0;
    for i=1:NC
        y=y+fx*h;
        x=x+h;
    end
end