A = [1 2 3
    4 5 6
    7 8 7
    4 2 3
    4 2 2];


[Q_CGS,R_CGS] = Q1_ClassicalGS(A)
[Q_MGS,R_MGS] = Q1_ModifiedGS(A)
[Q_HGS, R_HGS] = Q1_HR(A)


% We see that using Classical and modified GS we get same (Q,R) but when we
% use Householder reflection method we get a different R(with 5x3 dimension
%against 3x3 using other) and Q. It is because householder method gives 
%compelete matrix and thus have more columns than classical and modified GS. 
