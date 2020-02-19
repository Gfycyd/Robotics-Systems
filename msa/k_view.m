function K = k_view()
    
L = 0.01;    
    
E = 70e9; %Young's modulus
G = 25.5e9; %shear modulus

d = 50e-3; 

S = pi*d^2/4;
Iy = pi*d^4/64;
Iz = pi*d^4/64;

J = Iy + Iz;

K = [E*S/L 0                 0                 0           0                 0;
    0           12*E*Iz/L^3  0                 0           0              6*E*Iy/L^2;
    0           0       12*E*Iy/L^3            0      -6*E*Iy/L^2            0;
    0           0            0                 G*J/L       0                 0;
    0           0        -6*E*Iy/L^2           0          4*E*Iy/L           0;
    0           6*E*Iy/L^2   0                 0           0              4*E*Iz/L];

end