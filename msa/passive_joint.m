function [W,t] = passive_joint(leg)
lambd_p = lambda_p(leg);
lambd_r = lambda_r(leg);

W = [zeros(5,6),zeros(5,6); lambd_r,lambd_r;lambd_p,zeros(1,6);zeros(1,6),lambd_p];      
t = [lambd_r,-lambd_r;  zeros(5,6),zeros(5,6); zeros(1,6),zeros(1,6); zeros(1,6),zeros(1,6)];


end

