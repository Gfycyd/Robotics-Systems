function [lambda_p] = lambda_p(leg)
if leg=='x'
    lambda_p = [0 0 0 1 0 0];
end
  
if leg=='y'
    lambda_p = [0 0 0 0 1 0];
end

if leg=='z'
    lambda_p = [0 0 0 0 0 1];
end
end

