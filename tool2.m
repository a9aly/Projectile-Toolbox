function tool2(t,x,z,n)
rerun=1;
while rerun==1
    %% Taking Data from user
    disp ("Hi, this is tool 2 in projectile toolbox");
    disp ("Tool 2 computes the resultant velocity and angle of the projectile versus time");
    method=input("Choose Degree of Error: 2 for O(h^2) and 4 for o(h^4)");
    if(method ~=2 && method ~=4)
        method=2;
    end
    % calculateVorTheta -> 1-Velociy 2-Angle 3-Velocity and Angle
    calculateVorTheta=input("if you want to calculate resultant velocity enter 1 \nif you want to calculate angle of the projectile enter 2 \nif you want to calculate both enter 3\n");

    %% Compute Velocity and angle of the projectile versus time
    if(calculateVorTheta==1 || calculateVorTheta==3)
        resultantVelocity=zeros;
        vx=differential(t,x,method);
    end

    if(calculateVorTheta==2 || calculateVorTheta==3)
        angleOfProjectile=zeros;
        vz=differential(t,z,method);
    end

    if(calculateVorTheta==1 || calculateVorTheta==3)
        for i=1:n
            resultantVelocity(i) = sqrt(vx(i)^2+vz(i)^2);
        end
    end

    if(calculateVorTheta==2 || calculateVorTheta==3)
        for i=1:n
            angleOfProjectile(i) = atand(vz(i)/vx(i));
        end
    end

    %% Print output to user
    disp("Time");
    disp(t);
    if(calculateVorTheta==1 || calculateVorTheta==3)
        disp("Resultant Velocity");
        disp(resultantVelocity);
    end
    if(calculateVorTheta==2 || calculateVorTheta==3)
        disp("Angle Of Projectile");
        disp(angleOfProjectile);
    end
%% Ask User to Run the Tool Again or Exit %%
    rerun=input("If you wish to rerun tool2 enter 1 --- If you wish to proceed enter any other number ");        
end
end