function Kc = VJM(Jq, Jt)  

    k0 = 1e6; 
    k1 = k_view(); % as l1 = l2 = 0.01 that's equal with k2
    k2 = k_view();


    Kt = [k0         zeros(1,12)
          zeros(6,1) k1         zeros(6,6)
          zeros(6,1) zeros(6,6) k2];

    K0c = inv(Jt*inv(Kt)*Jt');
    Kcq = inv(Jq' * inv(K0c) * Jq) * Jq' * inv(K0c);
    Kc = K0c - K0c * Jq * Kcq;

end