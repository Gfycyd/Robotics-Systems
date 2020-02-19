function [q] = InverseAllAngles(end_effector, leg)
    
    x = end_effector(1);
    y = end_effector(2);
    z = end_effector(3);
    
    % choosed values for simplicity
    l1 = 0.01;
    l2 = 0.01;
    l3 = 0.01;
    l4 = 0.01;
    l5 = 0.01;
    l6 = 0.01;
    
    % due to some shifts
    qX = IK(y-0.5, z+0.25 , x, l1, l2);

    
    qY = IK( z-0.25, x, y-0.25, l3, l4);
    
    qZ = IK(y, x, z,  l5, l6);
    
% q - angles for each joint for each joints for each leg
    if leg == 'x' 
        q = qX;
    end
    if leg == 'y' 
        q = qY;
    end
     if leg == 'z' 
        q = qZ;
    end
end