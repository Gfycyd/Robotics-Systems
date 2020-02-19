function [q] = IK(x, y, z, l1, l2)
    sumAngles = 0;
    
    q0 = z;
    
    % elbow up configuration
    q2 = acos((x*x+y*y -l2 * l2 - l1 * l1)/(2*l1*l2));
    
    phi1 = atan(y/x);
    phi2 = atan(l2*cos(q2)/(l1+l2*sin(q2)));
    
    q1 = phi1+phi2;
    
    q3 = sumAngles-q2-q1;
    q = [q0, q1, q2, q3];
    
end