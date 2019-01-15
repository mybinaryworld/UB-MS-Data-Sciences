function lagr = Lagr(i, x, xp)
len = length(xp);
lagr = 1;

for j = 1 : len
    if i ~= j
        lagr = lagr .* (x - xp(j)) / (xp(i) - xp(j));
    end
end

end