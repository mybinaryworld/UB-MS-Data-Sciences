warning off MATLAB:ezplotfeval:NotVectorized
x = [1.02, 0.95, 0.87, 0.77, 0.67, 0.56, 0.44, 0.3, 0.16, 0.01]';
y = [0.39, .32, 0.27, 0.22, 0.18, 0.15, 0.13, 0.12, 0.13, 0.15]';
noise = unifrnd(-0.005,0.005,10,2);

nx = x + noise(:,1);
ny = y + noise(:,2);

A = [y.^2, y.*x, x, y, ones(10,1)];
b = x.^2;
coefficients = mldivide(A,b);

nA = [ny.^2, ny.*nx, nx, ny, ones(10,1)];
nb = nx.^2;
ncoefficients = mldivide(nA,nb);

%Part(b)
figure
fh = @(x,y,coef) coef(1)*y^2 + coef(2)*x*y + coef(3)*x + coef(4)*y + coef(5) - x^2;
ez1 = ezplot(@(x,y)fh(x,y,ncoefficients),[-2,2,-1,2]), axis equal;
set(ez1,'Color','red');
hold on
ez2 = ezplot(@(x,y)fh(x,y,coefficients),[-2,2,-1,2]), axis equal;
set(ez2,'Color','green');
hold on
scatter(nx,ny)
hold on 
scatter(x,y)
legend('noisy ellipse', 'original ellipse','noisy point', 'original point')

%Comparing coefficients
%We see that there is significant change in the coefficients even if we
%slightly change the coordinates.
coefficients
ncoefficients