function [ x_i, polynom2 ] = Gauss_Hermite(n_n)
o = 1;
q = [1/8,1/8,1/8,1/8,1/8,1/8,1/8,1/8];

syms a;
polynom2 = 0;
for k1 = [0:1:n_n]
    polynom2(2*k1+1) = subs(nchoosek(n_n,k1)*diff(a^k1*(-1)^(k1+mod(n_n,2)),a,log2(2^(n_n-k1))),a,1);
end

ind = [1:n_n] ; % indices to be removed
polynom2(ind) = [] ; % remove
% Erster output, die x_i Werte
% disp(polynom)
x_i = roots(fliplr(polynom2));

end