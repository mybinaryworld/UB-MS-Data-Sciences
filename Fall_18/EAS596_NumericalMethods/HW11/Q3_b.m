x0 = 1; 
xn = 2;
n = 2;
tolerance = 0.001;
error_estimate = 1;
init_s = composite_simpson(x0, xn, n);

while error_estimate > tolerance
    n = n + 2;
    simp_int = composite_simpson(x0, xn, n);
    error_estimate = (simp_int - init_s)/simp_int;
    init_s = simp_int;
end

disp("Intregated Value :")
disp(simp_int)
disp("No of iteration:")
disp(n)
function si = composite_simpson(a,b,n)
h = (b-a)/n;
fa = sqrt(1 + a^-2);
fb = sqrt(1 + b^-2);
ft=0;
for i=2:2:n
    x = (a+(i-1)*h);
    fx = sqrt(1 + x^-2);
    ft = ft + 4*fx;
end
for i=3:2:n
    x = (a+(i-1)*h);
    fx = sqrt(1 + x^-2);
    ft= ft + 2*fx;
end
si = (h/3)*(fa+fb+ft);
end