function Kc = Kc(T,T_base,T_tool,q,t)
    
l1 = 0.01;
l2 = 0.01;

J = JqX(T,T_base,T_tool,q,t,l1,l2);
J2 = JthetaX(T,T_base,T_tool,q,t,l1,l2);
Kc = VJM(J,J2);

end