x = 200:10:300;
y = 200:10:300;
z = 200:10:300;

F = [100,100,100,0,0,0];
graph = zeros(length(x),length(y),length(z));

for i=1:length(x)
    for j = 1:length(y)
        for k = 1:length(z)
   
            end_effector = [x(i)/1000,y(j)/1000,z(k)/1000,0,0,0];

            k1 = MSA('x',end_effector);
            k2 = MSA('y',end_effector);
            k3 = MSA('z',end_effector);
            K = k1 + k2 + k3;

            dt=inv(K)*F';
            dr=sqrt(dt(1)^2+dt(2)^2 + dt(3)^2);
            graph(i,j,k) = dr;
        end
    end
end

[x,y,z] = meshgrid(1:11,1:11,1:11);
figure
scatter3(x(:),y(:),z(:),50,graph(:), 'filled');
cb = colorbar;  


