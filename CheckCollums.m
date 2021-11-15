function CheckCollums(Ma1,Ma2)
%Summary of this function goes here
%   It checks if the number of attribiutes of testSet is not bigger than the
%   of trainSet
%
a = width(Ma1);
b = width(Ma2);

if (b-1)<=a
fprintf("Second Matrix is at least d-1 of the first matrix\n");
else
error("Second Matrix is NOT at least d-1 of the first matrix\n");
end


end