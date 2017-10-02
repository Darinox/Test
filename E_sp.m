function [ output_args ] = E_sp( R, n )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

%Min (E_sp_Ohne_Min)

E_sp_Ohne_Min = E_0 - p_x*(R - o_1(n,x))*log(2) + o_2(n,x,p_x);

end

