function [ Nullsein ] = p_x_solver( R, x, n, x_gewaehlt, p)
% p muss mit rein
tic
n1 = 4;
[x_i, H_n1] = Gauss_Hermite(n1);
% o_1; vk_1; vk_2
K = length(x);
q = [1/8, 1/8, 1/8, 1/8, 1/8, 1/8, 1/8, 1/8];

Teil_1_oben = 0;
for k1 = [1:1:K]
   Teil_1_oben =  Teil_1_oben + q(k1)*vk_1(x, k1, x_i, H_n1, n1);
end

Sum_vk_2 = 0;
for k1 = [1:1:K]
    Sum_vk_2 = Sum_vk_2 + q(k1)*vk_2(x, k1, x_i, H_n1, n1);
end
o_1(x, n);
Teil_1_unten = p * log(2);

Teil_2 = x(x_gewaehlt)*sqrt(2/n*Sum_vk_2) /(p*log(2));
%out = Teil_1_oben;
disp(Sum_vk_2)

Nullsein = o_1(x, n) - R - (Teil_1_oben/Teil_1_unten) + Teil_2;
toc
end

