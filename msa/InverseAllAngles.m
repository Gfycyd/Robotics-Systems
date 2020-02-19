function [q] = Inverse(end_effector,l1,l2,leg)
    
xx = end_effector(1);
yy = end_effector(2);
zz = end_effector(3);

if leg=='x'
    
    yy = yy -0.5;
    zz = zz+0.25;
    
    q_11 = xx;
    q_33 = acos((yy^2+zz^2-l1^2-l2^2)/(2*l1*l2));
    q_22 = -atan2((l2*sin(q_33)),(l1+l2*cos(q_33))) + atan2(zz,yy);
    q_44 = angle_x - q_22 - q_33;
    
end
    
if leg=='y'
    zz = zz-0.25;
    yy = yy-0.25;
    q_11 = yy;
    q_33 = acos((zz^2+xx^2-l1^2-l2^2)/(2*l1*l2));
    q_22 = -atan2(l2*sin(-q_33),l1+l2*cos(-q_33)) + atan2(zz,xx);
    q_44 = angle_y - q_22 - q_33;
    
end

if leg=='z'

    q_11 = zz;
    q_33 = acos((xx^2 + yy^2 - l1^2 - l2^2)/(2 * l1 * l2));
    q_22 = -atan2(l2*sin(q_33),l1+l2*cos(q_33)) + atan2(yy,xx);
    q_44 = angle_z - q_22 - q_33;
    
end
q = [q_11,q_22,q_33,q_44];
end







