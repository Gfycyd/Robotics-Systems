function [lambda_r] = lambda_r(leg)
if leg=='x'
    lambda_r = [0 1 0 0 0 0;
                0 0 1 0 0 0;
                0 0 0 1 0 0;
                0 0 0 0 1 0;
                0 0 0 0 0 1];
end
  
if leg=='y'
    lambda_r = [1 0 0 0 0 0;
                0 0 1 0 0 0;
                0 0 0 1 0 0;
                0 0 0 0 1 0;
                0 0 0 0 0 1];
end

if leg=='z'
    lambda_r = [1 0 0 0 0 0;
                0 1 0 0 0 0;
                0 0 0 1 0 0;
                0 0 0 0 1 0;
                0 0 0 0 0 1];
end
        
end