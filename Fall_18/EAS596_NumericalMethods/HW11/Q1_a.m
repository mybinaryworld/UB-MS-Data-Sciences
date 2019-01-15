% Question 1 (a)
clear; close all; clc;
X = [0.1; 0.2; 0.4; 0.6; 0.9; 1.3; 1.5; 1.7; 1.8];
Y = [0.75; 1.25; 1.45; 1.25; 0.85; 0.55; 0.35; 0.28; 0.18];
A = [ones(size(X)) X log(X)];
B = log(Y);
[U, S, V] = svd(A);
C1 = V*(S\U')*B;
figure
plot(X,Y,'ko') 
hold on
syms x y 
axis square
fimplicit(((C1'*[1;x;log(x)])-log(y)), 'b'); 
title('Linear Least Square Fit');
legend('Original Data points','Linear least square fit');
