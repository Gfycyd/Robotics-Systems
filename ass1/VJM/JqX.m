function [J] = JqX(T, T_base, T_tool, q, t,  l1, l2)

% Jacobian computing by Numerical Method for only 1 leg

T0 = T;
T0 = inv(T0(1:3,1:3));
T0=[T0,zeros(3,1);0 0 0 1];

J1 = Jcol(T_base * Tx(q(1)) * Tx(t(1)) * Rxd(q(2)) * Tz((l1)) * Rx(t(2)) * Ry(t(3)) * Rz(t(4)) * Tx(t(5)) * Ty(t(6)) * Tz(t(7)) * Rx(q(3)) * Ty((l2)) * Rx(t(8)) * Ry(t(9)) * Rz(t(10))*Tx(t(11))*Ty(t(12))*Tz(t(13))*Rx(q(4))*T_tool*T0);
J2 = Jcol(T_base * Tx(q(1)) * Tx(t(1)) * Rx(q(2)) * Tz((l1)) * Rx(t(2)) * Ry(t(3)) * Rz(t(4)) * Tx(t(5)) * Ty(t(6)) * Tz(t(7)) * Rxd(q(3)) * Ty((l2)) * Rx(t(8)) * Ry(t(9)) * Rz(t(10)) * Tx(t(11)) * Ty(t(12)) * Tz(t(13)) * Rx(q(4)) * T_tool * T0);
J3 = Jcol(T_base * Tx(q(1)) * Tx(t(1)) * Rx(q(2)) * Tx((l1)) * Rx(t(2)) * Ry(t(3)) * Rz(t(4)) * Tx(t(5)) * Ty(t(6)) * Tz(t(7)) * Rx(q(3)) * Tx((l2)) * Rx(t(8)) * Ry(t(9)) * Rz(t(10)) * Tx(t(11)) * Ty(t(12)) * Tz(t(13)) * Rxd(q(4)) * T_tool * T0);


J = [J1, J2, J3];

end
