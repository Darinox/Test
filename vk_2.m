function [ vk_2 ] = vk_2( x, k, x_i, polynom, n_n, p )
%tic

w = x(k);
o = 1;
q = [1/8,1/8,1/8,1/8,1/8,1/8,1/8,1/8];


% Das dar�ber ist die Vorbereitung der Gau�-Hermite-Quadrature

A = (1/sqrt(2*pi*o^2))^(1/(1+p));
B = 2*o^2 +2*o^2*p;
x_k1 = sqrt(B)*x_i + x(k);


vk_1_unten = 0;
vk_1_oben = 0;
vk_2_oben = 0;


for k1 = [1:1:n_n]
    w_i = (2^(n_n-1)*factorial(n_n)*sqrt(pi))/(n_n^2*H_n1(x_k1(k1), polynom, n_n)^2);
    f_i = (1/sqrt(2*pi*o^2)^(1/(1+p)) * ((exp(-((x_k1(k1)^2 -2*x_k1(k1)*x +x.^2)/(2*o^2)))).^(1/(1+p))*q'))^p;
    
    vk_1_unten =  vk_1_unten +A*sqrt(B)*w_i*f_i;
end

for k1 = [1:1:n_n]
    w_i = (2^(n_n-1)*factorial(n_n)*sqrt(pi))/(n_n^2*H_n1(x_k1(k1), polynom, n_n)^2);
    
    f_i = (1/sqrt(2*pi*o^2)^(1/(1+p)) * ((exp(-((x_k1(k1)^2 -2*x_k1(k1)*x +x.^2)/(2*o^2)))).^(1/(1+p))*q'))^p;
    p_yk = 1/sqrt(2*pi*o^2) * exp(-((x_k1(k1).^2 -2*x_k1(k1)'*w +w.^2)/(2*o^2)));
    f_log = log(p_yk^(1/(1+p)) *f_i/p_yk);
    f_log2 = log(p_yk^(1/(1+p)) *f_i/p_yk)^2;
    vk_1_oben =  vk_1_oben + A*sqrt(B)*w_i*f_i*f_log;
    vk_2_oben = vk_2_oben + A*sqrt(B)*w_i*f_i*f_log2;
end

vk_1 = vk_1_oben/vk_1_unten;
vk_2 = vk_2_oben/vk_1_unten + vk_1^2;

%toc
end