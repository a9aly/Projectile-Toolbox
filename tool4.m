%% Taking Data from user
function [t,vx,vz,n] = tool4()

rerun=1;
while rerun==1
    disp ("Hi, this is tool 4 in projectile toolbox");
    disp ("Tool 4 computes Resultant velocity and angle of the projectile versus time using ODEs");
    v0 = input ("Enter Initial Velocity in m/s: ");
    theta0 = input ("Enter Initial Angle in degrees: "); 
    timeToLand = input (    "Enter Travel Time for The Projectile in seconds: ");
    n = input("How many Vx and Vz values you want to identify in this interval? ");
    t=linspace(0,timeToLand,n);
    deltaTime=t(2)-t(1);
    vxORvz= input("Do you want to print vx or vz?\nEnter 1 for vx\nEnter 2 for vz\nEnter 3 for vx and vz\nEnter any other number to neglect printing either\n");
    printRes = input("If you want to print resultant velocity and angle at each time stamp enter 1");
    airResis = input("Do you want to account for air resistance?\nEnter 1 To ignore air resistance\nEnter 2 To incorporate air resistance\n");
    if(airResis == 2)
       method = input("Enter 1 for Euler's Method\nEnter 2 for RK4 Method\n"); 
    end

    %% Computing Resultant Velocity %%
    %% No Air Resistance %%
    if(airResis==1)
        if(vxORvz==1||vxORvz==3)
            vx=ones(1,n);                        % an array of n points of 1's
            vx=vx.*v0*cosd(theta0);               % the x component will be constant which is the result of v0 multiplied by cos(theta initial)
        end
        if(vxORvz==2||vxORvz==3)
            vz=v0*sind(theta0)-9.81*deltaTime*(0:n-1);      % the z component decelerates by at rate of -9.81t
        end

    %% Air Resistance %%    
    elseif(airResis==2)
        m=input ("Enter Mass of Projectile in kg: ");
        d=input ("Enter Diameter of Projectile in m: ");
        vx=zeros(1,n);
        vz=zeros(1,n);
        vx(1)=v0*cosd(theta0);
        vz(1)=v0*sind(theta0);
        %% Euler's Method %%
        if(method==1)
            for i=1:n-1
                [vx(i+1),vz(i+1)]=differentialProjectileModification(deltaTime,t(i),t(i+1),vx(i),vz(i),d,m,method);
            end
        %% RK4 Method %%
        elseif(method==2)
            for i=1:n-1
                [vx(i+1),vz(i+1)]=RK4(deltaTime,t(i),t(i+1),vx(i),vz(i),d,m);
            end
        end
    end
    %% Calculating resultant velocity and angle %%
    resV=sqrt(vx.^2+vz.^2);
    angle=atand(vz./vx);
     %% Printing results to user %%
    disp("Time");
    disp(t);
    if(vxORvz==1||vxORvz==3)
        disp("Velocity in x-direction in m/s")
        disp(vx);
    end
    if(vxORvz==2 || vxORvz==3)
        disp("Velocity in z-direction in m/s")
        disp(vz);
    end
    if(printRes==1)
    disp("Resultant Velocity in m/s")
    disp(resV);
    disp("Angle in degrees");
    disp(angle);
    end
    %% Ask User to Run the Tool Again or Exit %%
    rerun=input("If you wish to rerun tool4 enter 1 --- If you wish to proceed enter any other number ");
end
end