
vpos = [2,2;2,6;3,10;4,18;5,26;6,34;6,38];
hpos = [5,2;3,10;6,10;9,10;10,18;11,26;6,34;13,34];
A = zeros(15,40);
A = Q1_vline(A, vpos);
A = Q1_hline(A, hpos);

[U,S,V] = svd(A);

figure
semilogy(diag(S));
title('singular value plot using semilogy');
xlabel('k'), ylabel('\sigma_k');
rank(A)

figure
plot(diag(S));
title('singular value plot using plot');
xlabel('k'), ylabel('\sigma_k');
rank(A)      % The rank of A is 10.

for k = 1:rank(A)
    
    figure
    B = U(:,1:k)*S(1:k,1:k)*V(:,1:k)';
    pcolor(B)
    colormap(gray)
    title(['Low rank approxiamtion : Rank = ', num2str(k)]);
    set(gca, 'YDir','reverse')
end


