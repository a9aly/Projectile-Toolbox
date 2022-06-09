function [vxn1,vzn1] = differentialProjectileModification(h,t0,t1,vxi,vzi,D,m,method)
    %% Solving for f'(x) and f'(y)
    %% Calculating -(mass * gravitaional Force) 
    mg=m*9.81;        
    %% Calculating Resultant velocity
    v=sqrt((vxi)^2+(vzi)^2);
    %% Calculating Reynold's number 
    Re=(1.204*v*D)/(18.13*10^-6); %(density*resultantVelocity*effeciveDiameter)/dynamicViscosity
    %% Calculating Drag coefficient
    if(Re <0.2)                 %Reynold’s number
        Cd=24/Re;                     %Drag coefficient
    elseif((Re>=0.2)) %%(Re<2000)
        Cd=21.12/Re+6.3/sqrt(Re)+0.25;  %Drag coefficient
    end
    %% Caclulating Area of the projectile 
    A=((pi*D^2)/4);
    %% Calculating dv/dx and dv/dz
    fx= (-1/2*Cd*A*1.204*vxi*v)/m;
    fz= (-mg-1/2*Cd*A*1.204*vzi*v)/m;
    %% Applying Euler Method
    if(method==1)
        vxn1 = eulerMethod(h,t1,t0,vxi,fx);   %% Applying euler's method to get new velocity vx
        vzn1 = eulerMethod(h,t1,t0,vzi,fz);   %% Applying euler's method to get new velocity  vz
    %% Applying RK4 Method
    elseif(method==2)
        vxn1=fx;
        vzn1=fz;
    end
end