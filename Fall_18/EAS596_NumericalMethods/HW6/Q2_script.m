compare_table = zeros(9,4);
for i=2:10
    H = hilb(i);
    I = eye(i);
    [Q_CGS,R_CGS] = Q1_ClassicalGS(H);
    [Q_MGS,R_MGS] = Q1_ModifiedGS(H);
    [Q_HGS, R_HGS] = Q1_HR(H);
    [Q_qr, R_qr] = qr(H);
    compare_table(i,1) = i;
    compare_table(i,2) = norm(Q_CGS*Q_CGS' - I);
    compare_table(i,3) = norm(Q_MGS*Q_MGS' - I);
    compare_table(i,4) = norm(Q_HGS*Q_HGS' - I);
    compare_table(i,5) = norm(Q_qr*Q_qr' - I);
end

plot(compare_table(:,1),compare_table(:,2),'-g')
hold on
plot(compare_table(:,1),compare_table(:,3),'-r')
hold on
plot(compare_table(:,1),compare_table(:,4),'-b')
hold on
plot(compare_table(:,1),compare_table(:,5),'*')
xlabel('matrix-size')
ylabel('||(Q.T*Q)-I||')
grid on
legend('Classical','Modified','Householder','qr')



%COMMENT
%We see that for higher dimensions of matrices classical QR decomposition
%is unstable and we get an error shootoff after dimension 6x6 of hilbert
%matrix. We also see that the modified, householder's and matlab's qr are very accurate upto
%10 dimensions.