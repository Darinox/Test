function [ vk_1, w_i ] = vk_1( x, k, x_i, H_n1, n )
%tic

w = x(k);
syms y;
syms z;
o = 1;
p = 1;
%syms p;
q = [1/8,1/8,1/8,1/8,1/8,1/8,1/8,1/8];


% Das darüber ist die Vorbereitung der Gauß-Hermite-Quadrature

A = (1/sqrt(2*pi*o))^(1/(1+p));
B = 2*o^2 +2*o^2*p;
x_k1 = sqrt(B)*x_i + x(k);


vk_1_unten = 0;
vk_1_oben = 0;
for k1 = [1:1:n]
    w_i = subs((2^(k1-1)*factorial(k1)*sqrt(pi))/(k1^2*H_n1^2), z, x_k1(k1));
    %z_i = py.Rech.Py_Rech(char(w_i));
    f_i = subs((1/sqrt(2*pi*o^2)^(1/(1+p)) * sum((exp(-((y^2 -2*y*x +x.^2)/2*o^2))).^(1/(1+p))*q'))^p  ,  y, x_k1(k1)  );
    
    vk_1_unten =  vk_1_unten + A*w_i*f_i*sqrt(B);
end

disp('w_i')
disp(w_i)
%z_i = py.Rech.Py_Rech(char(w_i));
%z_i = round(w_i, 10);
%disp('z_i')
%disp(z_i)
%disp('f_i')
%disp(f_i)

for k1 = [1:1:n]
    w_i = subs((2^(k1-1)*factorial(k1)*sqrt(pi))/(k1^2*H_n1^2), z, x_k1(k1));
    %z_i = py.Rech.Py_Rech(char(w_i));
    f_i = subs(   (1/sqrt(2*pi*o^2)^(1/(1+p)) * ((exp(-((y^2 -2*y*x +x.^2)/2*o^2))).^(1/(1+p))*q'))^p  ,   y, x_k1(k1)  );
    p_yk = subs(1/sqrt(2*pi*o^2) * exp(-(y.^2 -2*y'*w +w.^2/2*o^2)), y, x_k1(k1));
    f_log = log(p_yk^(1/(1+p)) *f_i/p_yk);
    vk_1_oben =  vk_1_oben + A*sqrt(B)*w_i*f_i*f_log; 
end

%disp(f_log)
%disp(vk_1_oben)
%disp(vk_1_unten)
vk_1 = vk_1_oben/vk_1_unten;
%vk_2 = vk_2_oben/vk_1_unten + vk_1^2

%toc
end