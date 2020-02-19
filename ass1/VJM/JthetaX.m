function J = JthetaX(T,T_base,T_tool,q,t,l1,l2)
      % Jacobians for leg X by Numerical Method


T0 = T;
T0 = inv(T0(1:3,1:3));
T0=[T0,zeros(3,1);0 0 0 1];

Td = T_base * Tx(q(1)) * Txd(t(1)) * Rx(q(2)) * Tz((l1)) * Rx(t(2)) * Ry(t(3)) * Rz(t(4)) * Tx(t(5)) * Ty(t(6)) * Tz(t(7)) *Rx(q(3)) * Ty((l2)) * Rx(t(8)) * Ry(t(9)) * Rz(t(10)) * Tx(t(11)) * Ty(t(12)) * Tz(t(13))* Rx(q(4)) * T_tool * T0;
J1 = Jcol(Td); 

Td = T_base * Txd(q(1)) * Tx(t(1)) * Rx(q(2)) * Tz((l1)) * Rxd(t(2)) * Ry(t(3)) * Rz(t(4)) * Tx(t(5)) * Ty(t(6)) * Tz(t(7)) *Rx(q(3)) * Ty((l2)) * Rx(t(8)) * Ry(t(9)) * Rz(t(10)) * Tx(t(11)) * Ty(t(12)) * Tz(t(13))* Rx(q(4))  * T_tool * T0;
J2 = Jcol(Td); 

Td = T_base * Tx(q(1)) * Tx(t(1)) * Rx(q(2)) * Tz((l1)) * Rx(t(2)) * Ryd(t(3)) * Rz(t(4)) * Tx(t(5)) * Ty(t(6)) * Tz(t(7)) *Rx(q(3)) * Ty((l2)) * Rx(t(8)) * Ry(t(9)) * Rz(t(10)) * Tx(t(11)) * Ty(t(12)) * Tz(t(13))* Rx(q(4))  * T_tool * T0;
J3 = Jcol(Td); 

Td = T_base * Tx(q(1)) * Tx(t(1)) * Rx(q(2)) * Tz((l1)) * Rx(t(2)) * Ry(t(3)) * Rzd(t(4)) * Tx(t(5)) * Ty(t(6)) * Tz(t(7)) *Rx(q(3)) * Ty((l2)) * Rx(t(8)) * Ry(t(9)) * Rz(t(10)) * Tx(t(11)) * Ty(t(12)) * Tz(t(13))* Rx(q(4))  * T_tool * T0;
J4 = Jcol(Td); 

Td = T_base * Tx(q(1)) * Tx(t(1)) * Rx(q(2)) * Tz((l1)) * Rx(t(2)) * Ry(t(3)) * Rz(t(4)) * Txd(t(5)) * Ty(t(6)) * Tz(t(7)) *Rx(q(3)) * Ty((l2)) * Rx(t(8)) * Ry(t(9)) * Rz(t(10)) * Tx(t(11)) * Ty(t(12)) * Tz(t(13))* Rx(q(4))  * T_tool * T0;
J5 = Jcol(Td); 

Td = T_base * Tx(q(1)) * Tx(t(1)) * Rx(q(2)) * Tz((l1)) * Rx(t(2)) * Ry(t(3)) * Rz(t(4)) * Tx(t(5)) * Tyd(t(6)) * Tz(t(7)) *Rx(q(3)) * Ty((l2)) * Rx(t(8)) * Ry(t(9)) * Rz(t(10)) * Tx(t(11)) * Ty(t(12)) * Tz(t(13))* Rx(q(4))  * T_tool * T0;
J6 = Jcol(Td); 

Td = T_base * Tx(q(1)) * Tx(t(1)) * Rx(q(2)) * Tz((l1)) * Rx(t(2)) * Ry(t(3)) * Rz(t(4)) * Tx(t(5)) * Ty(t(6)) * Tzd(t(7)) *Rx(q(3)) * Ty((l2)) * Rx(t(8)) * Ry(t(9)) * Rz(t(10)) * Tx(t(11)) * Ty(t(12)) * Tz(t(13)) * Rx(q(4)) * T_tool * T0;
J7 = Jcol(Td); 

Td = T_base * Tx(q(1)) * Tx(t(1)) * Rx(q(2)) * Tz((l1)) * Rx(t(2)) * Ry(t(3)) * Rz(t(4)) * Tx(t(5)) * Ty(t(6)) * Tz(t(7)) *Rx(q(3)) * Ty((l2)) * Rxd(t(8)) * Ry(t(9)) * Rz(t(10)) * Tx(t(11)) * Ty(t(12)) * Tz(t(13))* Rx(q(4)) * T_tool * T0;
J8 = Jcol(Td); 

Td = T_base * Tx(q(1)) * Tx(t(1)) * Rx(q(2)) * Tz((l1)) * Rx(t(2)) * Ry(t(3)) * Rz(t(4)) * Tx(t(5)) * Ty(t(6)) * Tz(t(7)) *Rx(q(3)) * Ty((l2)) * Rx(t(8)) * Ryd(t(9)) * Rz(t(10)) * Tx(t(11)) * Ty(t(12)) * Tz(t(13))* Rx(q(4)) * T_tool * T0;
J9 = Jcol(Td); 

Td = T_base * Txd(q(1)) * Tx(t(1)) * Rx(q(2)) * Tz((l1)) * Rx(t(2)) * Ry(t(3)) * Rz(t(4)) * Tx(t(5)) * Ty(t(6)) * Tz(t(7)) *Rx(q(3)) * Ty((l2)) * Rx(t(8)) * Ry(t(9)) * Rzd(t(10)) * Tx(t(11)) * Ty(t(12)) * Tz(t(13))* Rx(q(4))  * T_tool * T0;
J10 = Jcol(Td); 

Td = T_base * Tx(q(1)) * Tx(t(1)) * Rx(q(2)) * Tz((l1)) * Rx(t(2)) * Ry(t(3)) * Rz(t(4)) * Tx(t(5)) * Ty(t(6)) * Tz(t(7)) *Rx(q(3)) * Ty((l2)) * Rx(t(8)) * Ry(t(9)) * Rz(t(10)) * Txd(t(11)) * Ty(t(12)) * Tz(t(13))* Rx(q(4)) *  T_tool * T0;
J11 = Jcol(Td); 

Td = T_base * Tx(q(1)) * Tx(t(1)) * Rx(q(2)) * Tz((l1)) * Rx(t(2)) * Ry(t(3)) * Rz(t(4)) * Tx(t(5)) * Ty(t(6)) * Tz(t(7)) *Rx(q(3)) * Ty((l2)) * Rx(t(8)) * Ry(t(9)) * Rz(t(10)) * Tx(t(11)) * Tyd(t(12)) * Tz(t(13)) * Rx(q(4))*  T_tool * T0;
J12 = Jcol(Td); 

Td = T_base * Tx(q(1)) * Tx(t(1)) * Rx(q(2)) * Tz((l1)) * Rx(t(2)) * Ry(t(3)) * Rz(t(4)) * Tx(t(5)) * Ty(t(6)) * Tz(t(7)) *Rx(q(3)) * Ty((l2)) * Rx(t(8)) * Ry(t(9)) * Rz(t(10)) * Tx(t(11)) * Ty(t(12)) * Tzd(t(13))* Rx(q(4))  * T_tool * T0;

J13 = Jcol(Td); 

J = [J1, J2, J3, J4,J5, J6, J7, J8,J9, J10, J11, J12, J13];
end