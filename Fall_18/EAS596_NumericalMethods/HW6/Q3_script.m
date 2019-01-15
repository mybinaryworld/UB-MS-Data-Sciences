x = [0 1 2 3 4 5 6]';
y = [-0.02 1.1 1.98 3.05 3.95 5.1 6.02]';

%least-squares using linear funtion
X_1 = [ones(7,1) x];
coef_1 = inv(X_1'*X_1)*X_1'*y; 

%least-squares using quadratic funtion
X_2 = [ones(7,1) x x.^2];
coef_2 = inv(X_2'*X_2)*X_2'*y;

%plot for linear function
plot(x, y, 'bo')
hold on
y_1 = coef_1(1)+x*coef_1(2);
plot(x, y_1, '-r')

%plot for quadratic function
figure;
plot(x, y, 'bo')
hold on
y_2 = coef_2(1)+x*coef_2(2)+x*coef_2(3);
plot(x, y_2, '-g')



%COMMENT
%We can observe from the graph that both the functions, linear and quadratic fits the data
%but if we see the data we can infer that y increases linearly with x. But the graph points
%that quadratic function also fits the data. This is due to the fact that when we fit the quadratic
%fuction, its coefficient for the square term is very less, hence execuding
%linear characterstics and fitting the data as well.



