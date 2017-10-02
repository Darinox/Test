function [ P_e ] = P_e( R, x, x_i, polynom, n, n_n, q, px )

P_e = exp( - E_sp( R, x, x_i, polynom, n, n_n, q, px ));

end

