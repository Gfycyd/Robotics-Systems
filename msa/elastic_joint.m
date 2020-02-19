function [W,t] = elastic_joint(leg)
lambd_e = lambda_e(leg);
lambd_r = lambda_r(leg);

W = [zeros(5,6),zeros(5,6); eye(6),     eye(6); lambd_e,      zeros(1,6)];
t = [lambd_r,    -lambd_r; zeros(6), zeros(6); 1e-6*lambd_e, -1e-6*lambd_e];
end

