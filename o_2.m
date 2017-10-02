function [ o_2 ] = o_2( n, n_n, x, p )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
K = length(x);
q = [1/8, 1/8, 1/8, 1/8, 1/8, 1/8, 1/8, 1/8];

[x_i, poly] = Gauss_Hermite(n_n);

Sum_vk_2 = 0;
for k1 = [1:1:K]
    Sum_vk_2 = Sum_vk_2 + q(k1)*vk_2(x, k1, x_i, poly, n_n, p);
end


o_2 = x*sqrt(8/n*Sum_vk_2) + log(8)/n - log(2-1/(x*x'))/n;

end