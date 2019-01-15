function AM = Q1_vline(A, pos)
    AM = A;
    for i = 1:size(pos)
        r = pos(i,1);
        c = pos(i,2);
        AM(r:r+7, c:c+1) = 1;
    end
end