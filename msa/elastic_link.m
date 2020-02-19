function [W,t] = elastic_link(length,q,leg) %q_x 
if leg =='x'
    R_x1 = Rx(q);
    R_x1 = R_x1(1:3,1:3);
    Q1 = zeros(12);
    Q1(1:3,1:3) = R_x1;
    Q1(4:6,4:6) = R_x1;
    Q1(7:9,7:9) = R_x1;
    Q1(10:12,10:12) = R_x1;

    Q2 = zeros(12);
    Q2(1:3,1:3) = R_x1';
    Q2(4:6,4:6) = R_x1';
    Q2(7:9,7:9) = R_x1';
    Q2(10:12,10:12) = R_x1';

    K = k_view();
    K22=K;
    l_skew = [0,-length(3),length(2);
              length(3),0,-length(1);
              -length(2),length(1),0];

    
    transform = -[eye(3),zeros(3);
                  l_skew',eye(3)];
    K12 = transform * K22;


    roty = Ry(pi);
    full_roty = [roty(1:3,1:3),zeros(3); 
                 zeros(3),roty(1:3,1:3)];

    K11 = full_roty' * K * full_roty;

    transform = -[eye(3),zeros(3);
                  l_skew,eye(3)];
    K21 = transform * K11;
end
        
if leg =='y'
%     Q1 - rotation matrix for changing the orientation as in global 
    R_y1 = Ry(q);
    R_y1 = R_y1(1:3,1:3);
    Q1 = zeros(12);
    Q1(1:3,1:3) = R_y1;
    Q1(4:6,4:6) = R_y1;
    Q1(7:9,7:9) = R_y1;
    Q1(10:12,10:12) = R_y1;
%     Q2 - inverse of Q1
    Q2 = zeros(12);
    Q2(1:3,1:3) = R_y1';
    Q2(4:6,4:6) = R_y1';
    Q2(7:9,7:9) = R_y1';
    Q2(10:12,10:12) = R_y1';

%     stiffness for cylindrical object
    K = k_view();
    
    K22=K;
    l_skew = [0,-length(3),length(2);
              length(3),0,-length(1);
              -length(2),length(1),0];

    transform = -[eye(3),zeros(3);
                  l_skew',eye(3)];
    K12 = transform * K22;


    rotz = Rz(pi);
    full_rotz = [rotz(1:3,1:3),zeros(3); %may be here mistake!!!!!!
                 zeros(3),rotz(1:3,1:3)];

    K11 = full_rotz' * K * full_rotz;

    transform = -[eye(3),zeros(3);
                  l_skew,eye(3)];
    K21 = transform * K11;
    
end

if leg =='z'
%     Q1 - rotation matrix for moving
    R_z1 = Rz(q);
    R_z1 = R_z1(1:3,1:3);
    Q1 = zeros(12);
    Q1(1:3,1:3) = R_z1;
    Q1(4:6,4:6) = R_z1;
    Q1(7:9,7:9) = R_z1;
    Q1(10:12,10:12) = R_z1;
    
    Q2 = zeros(12);
    Q2(1:3,1:3) = R_z1';
    Q2(4:6,4:6) = R_z1';
    Q2(7:9,7:9) = R_z1';
    Q2(10:12,10:12) = R_z1';

    
    K = k_view();

    K22=K;
    l_skew = [1e-8,-length(3),length(2);
              length(3),1e-8,-length(1);
              -length(2),length(1),1e-8];

    transform = -[eye(3),zeros(3);
                  l_skew',eye(3)];
    K12 = transform * K22;


    roty = Ry(pi);
    full_roty = [roty(1:3,1:3),zeros(3); %may be here mistake!!!!!!
                 zeros(3),roty(1:3,1:3)];

    K11 = full_roty' * K * full_roty;

    transform = -[eye(3),zeros(3);
                  l_skew,eye(3)];
    K21 = transform * K11;
end


W = [-eye(12)];
t = [K11,K12;K21,K22];             

t = Q1*t*Q2;


end

