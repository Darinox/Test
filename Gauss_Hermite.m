function [ x_i, polynom2 ] = Gauss_Hermite(n)
% sym loswerden
o = 1;
q = [1/8,1/8,1/8,1/8,1/8,1/8,1/8,1/8];

syms a;
polynom2 = 0;
for k1 = [0:1:n]
    %H_n1 = H_n1 + nchoosek(n,k1);
    %H_n1 = H_n1 + nchoosek(n,k1)*diff(z^k1*(-1)^(k1+mod(n,2)),z,log2(2^(n-k1)));
    polynom2(2*k1+1) = subs(nchoosek(n,k1)*diff(a^k1*(-1)^(k1+mod(n,2)),a,log2(2^(n-k1))),a,1);
end

ind = [1:n] ; % indices to be removed
polynom2(ind) = [] ; % remove
%Erster output, die x_i Werte
%disp(polynom)
x_i = roots(fliplr(polynom2));


%%H_n1
%H_n1 = 0;
%B = 2*o^2 +2*o^2*p;
%x_k1 = sqrt(B)*x_i + x(k);
%tic
%for k2 = [1:1:n]
    %for k1 = [1:1:n+1]
        %H_n1 = H_n1 + polynom(k1)*x_k1(k2)^(k1-1);
    %end
%end
%toc

end