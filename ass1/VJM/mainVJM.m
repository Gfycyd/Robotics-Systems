clc;
clear all

T_tool = eye(4);
T_base_x = [1 0 0 0; 0 1 0 0.5; 0 0 1 -0.25; 0 0 0 1];
T_base_z = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];
T_base_y = [1 0 0 0; 0 1 0 0.25; 0 0 1 0.25; 0 0 0 1];
L = 0.01;
t = zeros(1,13);

F1 = [0,0,0,0,0,0]';
F2 = [100,0,0,0,0,0]';
F3 = [0,100,0,0,0,0]';
F4 = [0,0,100,0,0,0]';
F5 = [100,100,100,0,0,0]';

x = 200:10:300;
y = 200:10:300;
z = 200:10:300;

xyz = zeros(length(x),length(y), length(z));
for i=1:length(x)
    for j = 1:length(y)
        for k = 1:length(z)
            end_effector = [i,j,k,0,0,0]';
 
            qx = InverseAllAngles(end_effector, 'x');
            Tx = FK(T_base_x,T_tool,qx,t);

            qy = InverseAllAngles(end_effector, 'y');
            Ty = FK(T_base_y,T_tool,qy,t);

            qz = InverseAllAngles(end_effector, 'z');
            Tz = FK(T_base_z,T_tool,qz,t);
            KcX = Kc(Tx, T_base_x, T_tool, qx, t);
            KcY = Kc(Ty, T_base_y, T_tool, qy, t);
            KcZ = Kc(Tz, T_base_z, T_tool, qz, t);
            K = KcSum(KcX, KcY, KcZ);

            dt = inv(K)*F1;
            dr=sqrt(dt(1)^2+dt(2)^2+dt(3)^2);
            z1(i,j,k) = dr;

            dt = inv(K)*F2;
            dr=sqrt(dt(1)^2+dt(2)^2+dt(3)^2);
            z2(i,j,k) = dr;

            dt = inv(K)*F3;
            dr=sqrt(dt(1)^2+dt(2)^2+dt(3)^2);
            z3(i,j,k) = dr;

            dt = inv(K)*F4;
            dr=sqrt(dt(1)^2+dt(2)^2+dt(3)^2);
            z4(i,j,k) = dr;
            
            dt = inv(K)*F5;
            dr=sqrt(dt(1)^2+dt(2)^2+dt(3)^2);
            xyz(i,j,k) = dr;      

        end
    end
end

figure
xlabel('x')
ylabel('y')
zlabel('z')

[x1,y1,z1] = meshgrid(1:11,1:11,1:11);
scatter3(x1(:),y1(:),z1(:),20,xyz(:));
cb = colorbar;    



