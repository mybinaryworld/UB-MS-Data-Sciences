x0 = 1; 
xn = 2;
err = 0.001;
n = 2;
err_est = 1;
area = composite_trapezoid(x0, xn, n);

while err_est > err
    n = n + 1;
    trap_incre = composite_trapezoid(x0, xn, n);
    err_est = (trap_incre - area)/trap_incre;
    area = trap_incre;
end
disp("Value of integration:")
disp(trap_incre)
disp("No of intervals:")
disp(n)

function trapezoid = composite_trapezoid(a,b,n)
h = (b-a)/n;
fa = sqrt(1 + a^-2);
fb = sqrt(1 + b^-2);
ft=0;
for i=2:n
    ft = ft+(2*sqrt(1 + (a+(h*(i-1)))^-2));
end
trapezoid=(h/2)*(fa+fb+ft);
end