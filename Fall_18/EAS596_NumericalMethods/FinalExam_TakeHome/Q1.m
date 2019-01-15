%Problem 1.a 
clear;
clc;

%Using 4th order Runge Kutta method
[t,y] = ode45(@(t,y) func(t,y),[0,1],0);
plot(t,y);xlabel('time steps');
ylabel('output response y');
title('Inital Value Problem using 4th order Ranga Kutta')
% The ode45 method took 57 steps

%1.d
n=2;
error_est = 1;
tol = 0.01;
fun = @(t)(t*exp(-t*t)*(-2*t+1/t));
fun_old = gauss_quad(fun,0,1,n);
while error_est > tol
    n = n+2;
    f_new = gauss_quad(fun,0,1,n);
    error_est = (f_new - fun_old)/f_new;
    fun_old = f_new;
end
gauss_interval = n
gauss_solution = f_new
%Solution obtained using two point gauss quadrature is 0.36789 with gauss
%interval 4. Therefore the number of points needed for 2 point gauss
%quadrature to get within 1% accuracy of the exact solution is 4. And the
%number of steps needed by ode45 is 57.

%Function for y_dot
function dy = func(t,y)
if t == 0
    dy=1;
else
    dy=y*(-2*t+1/t);
end
end