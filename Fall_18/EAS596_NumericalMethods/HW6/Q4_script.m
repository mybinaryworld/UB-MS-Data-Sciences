m =50; n=12;
t = linspace(0,1,m);

A= fliplr(vander(t));
A = A(:,1:n);
b = cos(4*t)';

%a) Solution using normal equation
coef_normal = inv(A'*A)*A'*b; 

%b) Solution using modified Gram Schmidt
[Q_MGS1,R_MGS1] = Q1_ModifiedGS(A);
coef_MGS = R_MGS1\Q_MGS1.'*b;
    
%c) Solution using householder reflector
[Q_HR1,R_HR1] = Q1_ModifiedGS(A);
coef_HR = R_HR1\Q_HR1.'*b;

%d) Solution using Matlab's qr
[Q_qr,R_qr] = qr(A);
coef_qr = R_qr\Q_qr.'*b;

%e) Solution using Matlab's A\b
coef_ab = A\b;


plot(coef_normal, 'bo')
hold on
plot(coef_MGS, '*')
hold on
plot(coef_HR, 'ro')
hold on
plot(coef_qr, 'r*')
hold on
plot(coef_ab, 'go')
legend('normal equation', 'modified GS','Householder', 'Matlab_qr', 'Matlab_ab')


%COMMENT
%From the graph we observe that all the methods gives very close results.