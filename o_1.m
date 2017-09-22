function [ out ] = o_1(x, n)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
K = length(x);

out = 2/n + log2(nchoosek(n+K-1,K-1))/n - log2(2-1/(x*x'))/n;

end

