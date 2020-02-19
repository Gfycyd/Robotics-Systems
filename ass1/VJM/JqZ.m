function J = JqZ(T, T_base, T_tool, q, t, l1, l2)

% Jacobian computing by Numerical Method for only 1 leg ( leg Z)
% all t's - zeroes

T0 = T;
T0 = inv(T0(1:3,1:3));
T0 = [T0,zeros(3,1);0 0 0 1];

J1 = Jcol(T_base * Tz(q(1)) * Tz(t(1)) * Rzd(q(2)) * Tx((l1)) * Rx(t(2)) * Ry(t(3)) * Rz(t(4)) * Tx(t(5)) * Ty(t(6)) * Tz(t(7)) ...
    *Rz(q(3)) * Ty((l2)) * Rx(t(8)) * Ry(t(9)) * Rz(t(10)) * Tx(t(11)) * Ty(t(12)) * Tz(t(13)) * Rz(q(4))  * T_tool * T0);

% third column for jacobian
J2 = Jcol(T_base * Tz(q(1)) * Tz(t(1)) * Rz(q(2)) * Tx((l1)) * Rx(t(2)) * Ry(t(3)) * Rz(t(4)) * Tx(t(5)) * Ty(t(6)) * Tz(t(7)) ...
    *Rzd(q(3)) * Ty((l2)) * Rx(t(8)) * Ry(t(9)) * Rz(t(10)) * Tx(t(11)) * Ty(t(12)) * Tz(t(13)) * Rz(q(4)) * T_tool * T0);


% % forth column for jacobian(but i am not sure if we really need it)
J3 = Jcol(T_base * Tz(q(1)) * Tz(t(1)) * Rz(q(2)) * Tx((l1)) * Rx(t(2)) * Ry(t(3)) * Rz(t(4)) * Tx(t(5)) * Ty(t(6)) * Tz(t(7)) ...
    *Rz(q(3)) * Ty((l2)) * Rx(t(8)) * Ry(t(9)) * Rz(t(10)) * Tx(t(11)) * Ty(t(12)) * Tz(t(13)) * Rzd(q(4)) * T_tool * T0);


Jq = [Jq1, Jq2, Jq3];

end
