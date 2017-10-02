function [ E_0 ] = E_0(x, x_i, polynom, n, q, p )
o = 1;
A = (1/sqrt(2*pi*o))^(1/(1+p));
B = 2*o^2 +2*o^2*p;
Sum_q_p = 0;
for k = [1:1:length(q)]
    x_k1 = sqrt(B)*x_i + x(k);
    %%%%%%%%%%%%%%%%%%%%%% nimmt das Polynom um die H_n1 Funktion aufzustellen
    H_n1 = 0;
    for k2 = [1:1:n]
        for k1 = [1:1:n+1]
            H_n1 = H_n1 + polynom(k1)*(sqrt(2)*x_k1(k2))^(k1-1);
            Test = 0;
        end
    end
    H_n1 = 2^(n/2)*H_n1;
    %%%%%%%%%%%%%%%%%%%%%%
    for k3 = [1:1:n]
        w_i = (2^(k3-1)*factorial(k3)*sqrt(pi))/(k3^2*H_n1^2);
        f_i = 1;
        Sum_q_p = Sum_q_p + q(k)*A*sqrt(B)*w_i*f_i;
    end  
end
fprintf('%d \n', Sum_q_p);
%E_0 = Sum_q_p;

Sum_E_0 = Sum_q_p^(1 + p);

E_0 = -log(Sum_E_0);
    
end

