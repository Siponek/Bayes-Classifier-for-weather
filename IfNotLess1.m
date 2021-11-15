function IfNotLess1(Ma1,Ma2)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

a = width(Ma1);
b = width(Ma2);

prod(Ma1 <1);
prod(Ma2 <1);

if prod(prod(Ma1 >=1))
fprintf("First Matrix is all good\n");
else
fprintf("First Matrix has 0 in it\n");
end


if prod(prod(Ma2 >=1))
fprintf("Second Matrix is all good\n");
else
fprintf("Second Matrix has 0 in it\n");
end
end