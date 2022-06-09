function [t,x,z] = tool3(t,Vx,Vz)
rerun=1;
while rerun==1
    %% Taking Data from user
    disp ("Hi, this is tool 3 in projectile toolbox");
    disp ("Tool 3 computes Position (x,z) versus time (t)");
    method = input("Which Method do you want to use\nEnter 1 to pick Trapezoidal rule.\nEnter 2 to pick Simpson's 1/3 rule.\n");
    %% Conduct numerical integration using a. Trapezoidal rule
    if(method==1)
        xT=zeros(size(Vx));
        zT=zeros(size(Vz));
        for i=1:length(xT)-1
            xT(i+1)=xT(i)+trapezoidalRule(t(i:i+1),Vx(i:i+1));
            zT(i+1)=zT(i)+trapezoidalRule(t(i:i+1),Vz(i:i+1));
        end
        disp("Time");
        disp(t);
        disp("X-position");
        disp(xT);
        disp("Z-position");
        disp(zT);
        x=xT;
        z=zT;
        grph=input("Do you which to plot x-position versus y-position?\nEnter 1 to plot the graph.\nEnter any other number to procced.\n");
        if(grph==1)
           subplot(2,1,1)      
           plot(xT,zT)
           title('Projectile (x) vs Projectile (z) Trapezoidal rule')
           xlabel('Position (x)')
           ylabel('Position (z)')
        end
    %% Conduct numerical integration using b. Simpson’s 1/3 rule
    else
        xS=zeros(size(Vx));
        zS=zeros(size(Vz));
        % Applying simpson rule for each three consecutive points up to n-2
        % Simpson's rule apply for 2 segments at once so i loops for
        % points between 2 segments points
        %For first position after initial apply trapezoidal
        xS(2)=xS(1)+trapezoidalRule(t(1:2),Vx(1:2));
        zS(2)=zS(1)+trapezoidalRule(t(1:2),Vz(1:2));
        %For odd points
        for i=1:2:length(xS)-2
            xS(i+2)=xS(i)+simpsRule(t(i:i+2),Vx(i:i+2));
            zS(i+2)=zS(i)+simpsRule(t(i:i+2),Vz(i:i+2));
        end
        %For Even points
        for i=2:2:length(xS)-3
            xS(i+2)=xS(i)+simpsRule(t(i:i+2),Vx(i:i+2));
            zS(i+2)=zS(i)+simpsRule(t(i:i+2),Vz(i:i+2));
        end
        %For even number of points apply trapezoidal to last point
        xS(end)=xS(end-1)+trapezoidalRule(t(end-1:end),Vx(end-1:end));
        zS(end)=zS(end-1)+trapezoidalRule(t(end-1:end),Vz(end-1:end));
        disp("Time");
        disp(t);
        disp("X-position");
        disp(xS);
        disp("Z-position");
        disp(zS);
        x=xS;
        z=zS;
        grph=input("Do you which to plot x-position versus y-position?\nEnter 1 to plot the graph.\nEnter any other number to procced.\n");
        if(grph==1)
            subplot(2,1,2)      
            plot(xS,zS)
            title('Position (x) vs Position (z) Simpson’s 1/3 rule')
            xlabel('Position (x)')
            ylabel('Position (z)')
        end
    end
 %% Ask User to Run the Tool Again or Exit %%
    rerun=input("If you wish to rerun tool3 enter 1 --- If you wish to proceed enter any other number ");    
end
end
