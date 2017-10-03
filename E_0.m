function [ E_0 ] = E_0( x, x_i, polynom, n_n, q, p )
o = 1;
A = (1/sqrt(2*pi*o^2))^(1/(1+p));
B = 2*o^2 +2*o^2*p;
Sum_q_p = 0;
for k = [1:1:length(q)]
    x_k1 = sqrt(B)*x_i + x(k);
    for k3 = [1:1:n_n]
        w_i = (2^(n_n-1)*factorial(n_n)*sqrt(pi))/(n_n^2*H_n1(x_k1(k3), polynom, n_n)^2);
        f_i = 1;
        Sum_q_p = Sum_q_p + q(k)*A*sqrt(B)*w_i*f_i;
    end  
end
%fprintf('%d \n', Sum_q_p);
%E_0 = Sum_q_p;

Sum_E_0 = Sum_q_p^(1 + p);

E_0 = -log(Sum_E_0);
    
end

