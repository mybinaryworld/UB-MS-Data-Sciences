function [xn, error_est] = newtonSolver( func, deriv, x0, tol, max_iters )
xn = x0;
for i = 1:max_iters
    f = func(xn);
    error_est(i) = abs(f);
    if( error_est(i) < tol )
       break
    end
    xn = xn - f/deriv(xn);
end
