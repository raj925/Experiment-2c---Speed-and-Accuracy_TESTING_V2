% x is the subscale array
% y is the original scale data
% z is the current total in the recursion
function f = subscale(x,y,z)
if isempty(x)
    f = z;
    return
else
    f = subscale(x(2:length(x)),y,z+y(x(1)));
end
end

