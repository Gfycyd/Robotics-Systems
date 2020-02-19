function [Kc] = MSA(leg,end_effector)
rigid_base_W = [zeros(6)];
rigid_base_t = [eye(6)];

[elastic_joint_1_W,elastic_joint_1_t] = elastic_joint(leg);
[passive_joint_2_W,passive_joint_2_t] = passive_joint(leg);
[passive_joint_3_W,passive_joint_3_t] = passive_joint(leg);
[passive_joint_4_W,passive_joint_4_t] = passive_joint(leg);             
l1 = [0.35,10e-4,10e-4];
l2 = [0.35,10e-4,10e-4];

q_x = InverseAllAngles(end_effector,l1(1),l2(1),leg);
[elastic_link_1_W,elastic_link_1_t] = elastic_link(l1,q_x(2),leg);
[elastic_link_2_W,elastic_link_2_t] = elastic_link(l2,q_x(2),leg);

      
Aggregated = zeros(84,84);

Aggregated(1:6,1:6) = rigid_base_W;
Aggregated(7:18,1:12) = elastic_joint_1_W;
Aggregated(19:30,7:18) = passive_joint_2_W;
Aggregated(31:42,13:24) = elastic_link_1_W;
Aggregated(43:54,19:30) = passive_joint_3_W;
Aggregated(55:66,25:36) = elastic_link_2_W;
Aggregated(67:78,31:42) = passive_joint_4_W;
Aggregated(79:84,37:42) = eye(6); 

Aggregated(1:6,43:48) = rigid_base_t;
Aggregated(7:18,43:54) = elastic_joint_1_t;
Aggregated(19:30,49:60) = passive_joint_2_t;
Aggregated(31:42,55:66) = elastic_link_1_t;
Aggregated(43:54,61:72) = passive_joint_3_t;
Aggregated(55:66,67:78) = elastic_link_2_t;
Aggregated(67:78,73:84) = passive_joint_4_t;


A = Aggregated(1:78,1:78);
B = Aggregated(1:78,79:84);
C = Aggregated(79:84,1:78);
D = Aggregated(79:84,79:84);

Kc = D - C * inv(A) * B;


end

