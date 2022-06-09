%% Displaying Welcome Message and Call Other Tools %%
disp("Hello This is a Projectile Toolbox of 4 tools to help you:");
disp(" 1- Identify the resultant velocity and direction of the projectile at each time step.");
disp(" 2- Identify the position of the projectile at each time step.");
disp(" 3- Identify the total length of the projectile’s path.");
rerun=1;    %% This Value Checks whether the user wants to run the program again or not %%       
while rerun==1
    clear
    %% Identify the resultant velocity and direction of the projectile at each time step %%
    disp("*************************************");
    disp("---------------Tool4-----------------");
    disp("*************************************");
    [t,vx,vz,n] = tool4();
    %% Identify the position of the projectile at each time step %%
    disp("*************************************");
    disp("---------------Tool3-----------------");
    disp("*************************************");
    [t,x,z]= tool3(t,vx,vz);
    %% Identify the total length of the projectile's path %%
    disp("*************************************");
    disp("---------------Tool1-----------------");
    disp("*************************************");
    tool1(x,z,n);
    %% Identify the resultant velocity and angle of the projcetile versus time using Numerical Differentiation %
    tool2Run=input("Do You Wish to get resultant velocity and angle of the projectile using points of x-position and z-position?\nEnter 1 to run tool2\nEnter any other number to exit.\n");
    if tool2Run==1
        disp("*************************************");
        disp("---------------Tool2-----------------");
        disp("*************************************");
        tool2(t,x,z,n);
    end
    %% Ask User to Run the Program Again or Exit %%
    rerun=input("If you wish to rerun the Toolbox enter 1 --- If you wish to exit enter any other number ");
end