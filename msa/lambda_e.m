function [lambda_e] = lambda_e(leg)
if leg=='x'
    lambda_e = [1 0 0 0 0 0];
end
  
if leg=='y'
    lambda_e = [0 1 0 0 0 0];
end

if leg=='z'
    lambda_e = [0 0 1 0 0 0];
end
        
end

