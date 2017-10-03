function [ H_n1_xi ] = H_n1( x_i_k1, polynom, n_n )
save = 0;
for k1 = [1:1:n_n+1]
    save = save + polynom(k1)*(sqrt(2)*x_i_k1)^(k1-1);
end


H_n1_xi = save;
end

