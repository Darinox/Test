function [ vk_2 ] = vk_2( x, k, x_i, polynom, n, p )
%tic

w = x(k);
syms y;
syms z;
o = 1;
q = [1/8,1/8,1/8,1/8,1/8,1/8,1/8,1/8];


% Das darüber ist die Vorbereitung der Gauß-Hermite-Quadrature

A = (1/sqrt(2*pi*o))^(1/(1+p));
B = 2*o^2 +2*o^2*p;
x_k1 = sqrt(B)*x_i + x(k);


vk_1_unten = 0;
vk_1_oben = 0;
vk_2_oben = 0;

%%%%%%%%%%%%%%%%%%%%%% nimmt das Polynom um die H_n1 Funktion aufzustellen
H_n1 = 0;
%tic
for k2 = [1:1:n]
    for k1 = [1:1:n+1]
        H_n1 = H_n1 + polynom(k1)*(sqrt(2)*x_k1(k2))^(k1-1);
    end
end
H_n1 = 2^(n/2)*H_n1;
%toc
%%%%%%%%%%%%%%%%%%%%%%

for k1 = [1:1:n]
    w_i = (2^(k1-1)*factorial(k1)*sqrt(pi))/(k1^2*H_n1^2);
    
    f_i = subs(   (1/sqrt(2*pi*o^2)^(1/(1+p)) * ((exp(-((y^2 -2*y*x +x.^2)/2*o^2))).^(1/(1+p))*q'))^p  ,    y, x_k1(k1)   );
    
    vk_1_unten =  vk_1_unten +A*sqrt(B)*w_i*f_i;
end

for k1 = [1:1:n]
    w_i = (2^(k1-1)*factorial(k1)*sqrt(pi))/(k1^2*H_n1^2);
    
    f_i = subs(   (1/sqrt(2*pi*o^2)^(1/(1+p)) * ((exp(-((y^2 -2*y*x +x.^2)/2*o^2))).^(1/(1+p))*q'))^p  ,    y, x_k1(k1)   );
    p_yk = subs(1/sqrt(2*pi*o^2) * exp(-(y.^2 -2*y'*w +w.^2/2*o^2)), y, x_k1(k1));
    f_log = log(p_yk^(1/(1+p)) *f_i/p_yk);
    f_log2 = log(p_yk^(1/(1+p)) *f_i/p_yk)^2;
    vk_1_oben =  vk_1_oben + A*sqrt(B)*w_i*f_i*f_log;
    vk_2_oben = vk_2_oben + A*sqrt(B)*w_i*f_i*f_log2;
end

vk_1 = vk_1_oben/vk_1_unten;
vk_2 = vk_2_oben/vk_1_unten + vk_1^2;

%toc
end