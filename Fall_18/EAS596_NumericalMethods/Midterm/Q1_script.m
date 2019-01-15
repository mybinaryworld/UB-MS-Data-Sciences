%Part(b)
x = [1.02, 0.95, 0.87, 0.77, 0.67, 0.56, 0.44, 0.3, 0.16, 0.01]';
y = [0.39, .32, 0.27, 0.22, 0.18, 0.15, 0.13, 0.12, 0.13, 0.15]';

A = [y.^2, y.*x, x, y, ones(10,1)]
b = x.^2;

coefficients = mldivide(A,b);

%Part(c)
fh = @(x,y,coef) coef(1)*y^2 + coef(2)*x*y + coef(3)*x + coef(4)*y + coef(5) - x^2;
figure
ezplot(@(x,y)fh(x,y,coefficients),[-1,2,-0.5,1.5]), axis equal;
hold on
scatter(x,y)
title('Planet orbit and positions')



  