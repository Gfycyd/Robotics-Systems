function fk = FK(T_base,T_tool,q,t)
    
% find the direct kinematics matrices for each leg
l1 = 0.01;
l2 = 0.01;

fkx = T_base * Tx(q(1)) * Tx(t(1)) * Rx(q(2)) * Ty(l1) * Rx(t(2)) * Ry(t(3)) * Rz(t(4)) * Tx(t(5)) * Ty(t(6)) * Tz(t(7)) ...
    *Rx(q(3)) * Ty(l2) * Rx(t(8)) * Ry(t(9)) * Rz(t(10)) * Tx(t(11)) * Ty(t(12)) * Tz(t(13)) * Rx(q(4)) * T_tool;

fky = T_base * Ty(q(1)) * Ty(t(1)) * Ry(q(2)) * Tz(l1) * Rx(t(2)) * Ry(t(3)) * Rz(t(4)) * Tx(t(5)) * Ty(t(6)) * Tz(t(7)) ...
    *Ry(q(3)) * Tz((l2)) * Rx(t(8)) * Ry(t(9)) * Rz(t(10)) * Tx(t(11)) * Ty(t(12)) * Tz(t(13)) * Ry(q(4)) * T_tool;

fkz = T_base * Tz(q(1)) * Tz(t(1)) * Rz(q(2)) * Tx(l1) * Rx(t(2)) * Ry(t(3)) * Rz(t(4)) * Tx(t(5)) * Ty(t(6)) * Tz(t(7)) ...
    *Rz(q(3)) * Tx(l2) * Rx(t(8)) * Ry(t(9)) * Rz(t(10)) * Tx(t(11)) * Ty(t(12)) * Tz(t(13)) * Rz(q(4)) * T_tool;

fk = [fkx, fky, fkz];
end