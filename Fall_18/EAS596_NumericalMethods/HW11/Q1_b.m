X = [0.1; 0.2; 0.4; 0.6; 0.9; 1.3; 1.5; 1.7; 1.8];
Y = [0.75; 1.25; 1.45; 1.25; 0.85; 0.55; 0.35; 0.28; 0.18];
tolerance = 1.0e-10;
a0 = 1; a1 = 1;
A = [a0;a1];
alpha = 0;
Y_hat = A(1) * X .* exp(A(2)*X);

R = Y - Y_hat;
so = (norm(R))^2;
while(norm(R)/norm(Y-Y_hat)>tolerance)
    Y_hat = A(1) * X .* exp(A(2)*X);
    R = Y - Y_hat;
    S = (norm(R))^2;
    if (S>so)
        break
    end
    dRda0 = -X.*exp(A(2)*X);
    dRda1 = -A(1)*(X.^2).*exp(A(2)*X);
    dRda0da1
    J = [dRda0 dRda1];
    D = (-1)*(J'*J)\(J'*R);
    A = A + alpha * D;
    alpha = alpha + 0.1; 
    so = S;
end
    
figure
plot(X,Y,'ko') 
hold on
syms x y 
axis square
fimplicit(y-A(1)*x*exp(A(2)*x), 'b'); 
title('Guass Newton Method');
legend('Original Data points','Minimum residual fit using Gauss Newton');