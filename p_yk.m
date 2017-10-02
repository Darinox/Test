function [ ] = p_yk( x, k, x_i, p, n_n )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
o = 1;
B = 2*o^2 + 2*o^2*p;
x_k1 = sqrt(B)*x_i + x(k);
w = x(k);
%fprintf('w    ');
%fprintf('%d \n', w);

for k1 = [1:1:n_n]
    p_yk_sol = 1/sqrt(2*pi*o^2) * exp(-(x_k1(k1).^2 -2*x_k1(k1)'*w +w.^2)/(2*o^2));
    %fprintf('%d   ', k1);
    %fprintf('p_yk   ');
    %fprintf('%d \n', p_yk_sol);
end

for k1 = [1:1:n_n]
    p_yk_sol_gekuerzt = exp(-(x_k1(k1).^2 -2*x_k1(k1)'*w +w.^2)/(2*o^2));
    %fprintf('%d   ', k1);
    %fprintf('x_k1(k1)  ');
    %fprintf('%d     ', x_k1(k1));
    %fprintf('p_yk_neu  ');
    %fprintf('%d \n', p_yk_sol_gekuerzt);
end

end

