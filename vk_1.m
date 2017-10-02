function [ vk_1, w_i ] = vk_1( x, k, x_i, polynom, n_n, p )

w = x(k);
o = 1;
q = [1/8,1/8,1/8,1/8,1/8,1/8,1/8,1/8];
A = (1/sqrt(2*pi*o))^(1/(1+p));
B = 2*o^2 +2*o^2*p;
x_k1 = sqrt(B)*x_i + x(k);


vk_1_unten = 0;
vk_1_oben = 0;

%%%%%%%%%%%%%%%%%%%%%% nimmt das Polynom um die H_n1 Funktion aufzustellen
H_n1 = 0;
for k2 = [1:1:n_n]
    for k1 = [1:1:n_n+1]
        H_n1 = H_n1 + polynom(k1)*(sqrt(2)*x_k1(k2))^(k1-1);
    end
end
H_n1 = 2^(n_n/2)*H_n1;
%%%%%%%%%%%%%%%%%%%%%%
for k1 = [1:1:n_n]
    w_i = (2^(k1-1)*factorial(k1)*sqrt(pi))/(k1^2*H_n1^2);
    f_i = (1/sqrt(2*pi*o^2)^(1/(1+p)) * sum((exp(-((x_k1(k1)^2 -2*x_k1(k1)*x +x.^2)/(2*o^2)))).^(1/(1+p))*q'))^p;
    
    vk_1_unten =  vk_1_unten + A*w_i*f_i*sqrt(B);
end


for k1 = [1:1:n_n]
    w_i = (2^(k1-1)*factorial(k1)*sqrt(pi))/(k1^2*H_n1^2);
    f_i = (1/sqrt(2*pi*o^2)^(1/(1+p)) * ((exp(-((x_k1(k1)^2 -2*x_k1(k1)*x +x.^2)/(2*o^2)))).^(1/(1+p))*q'))^p;
    p_yk = 1/sqrt(2*pi*o^2) * exp(-(x_k1(k1).^2 -2*x_k1(k1)'*w +w.^2)/(2*o^2));
    f_log = log(p_yk^(1/(1+p)) * f_i/p_yk);
    vk_1_oben =  vk_1_oben + A*sqrt(B)*w_i*f_i*f_log;
end

vk_1 = vk_1_oben/vk_1_unten;
end