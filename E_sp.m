function [ E_sp ] = E_sp( R, x, x_i, polynom, n, n_n, q, px )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

%Min (E_sp_Ohne_Min)

Vor_Min = E_0(x,x_i,polynom,n_n,q,px) - px*(R - o_1(x,n))*log(2) + o_2(n,x,px);


E_sp = min(Vor_Min);
end

