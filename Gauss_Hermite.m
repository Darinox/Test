function [ x_i, H_n1 ] = Gauss_Hermite(n)
% sym loswerden
syms y;
o = 1;
syms p;
q = [1/8,1/8,1/8,1/8,1/8,1/8,1/8,1/8];

H_n1 = 0;
syms z;
syms a;
polynom2 = 0;
for k1 = [0:1:n]
    H_n1 = H_n1 + nchoosek(n,k1)*diff(z^k1*(-1)^(k1+mod(n,2)),z,log2(2^(n-k1)));
    polynom2(2*k1+1) = subs(nchoosek(n,k1)*diff(a^k1*(-1)^(k1+mod(n,2)),a,log2(2^(n-k1))),a,1);
end

ind = [1:n] ; % indices to be removed
polynom2(ind) = [] ; % remove

x_i = roots(fliplr(polynom2));
%disp(x_i2)
end