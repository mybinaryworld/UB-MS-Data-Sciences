function AM = Q1_hline(A, pos)
    AM = A;
    for i = 1:size(pos)
        r = pos(i,1);
        c = pos(i,2);
        AM(r:r+1, c:c+5) = 1;
    end
end