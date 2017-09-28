function [ p_yk_sol ] = p_yk( x, k, x_i, p )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
o = 1;
B = 2*o^2 +2*o^2*p;
x_k1 = sqrt(B)*x_i + x(k);

p_yk_sol = 1/sqrt(2*pi*o^2) * exp(-(x_k1(k1).^2 -2*x_k1(k1)'*w +w.^2/2*o^2));

end

