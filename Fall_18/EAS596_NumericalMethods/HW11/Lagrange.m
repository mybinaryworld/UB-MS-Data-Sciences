function y = Lagrange(x, xp, yp)
len = length(xp);
y = 0;
for i = 1 : len
    y = y + yp(i) * Lagr(i, x, xp);
end

end