function [closest_x, closest_y] = newton_min(funx, funy, s_min, s_max, s_guess, pt_x, pt_y)
syms s;
Fun     = @(s) sqrt((funx(s) - pt_x)^2 + ((funy(s) - pt_y))^2);

%  initializing parameters
 error_costfunction = 1; iteration = 1; s_values(1,1)  = s_guess;

 %Setting error tolerance to 10^-5 
while error_costfunction >= 10^(-5)
    costfun_values(iteration,1)       = Fun(s_values(iteration));
    iteration             = iteration + 1;
    dif1                  = diff(Fun(s));
    dif2                  = diff(dif1);
    dif1x                 = eval(subs(dif1, s, s_values(iteration-1,1)));
    dif2x                 = eval(subs(dif2, s, s_values(iteration-1,1)));
    s_values(iteration,1) = s_values(iteration-1,1) - 0.5*(dif1x/dif2x);  % x(k) = x(k-1) - {f'(x(k-1)) / f"(x(k-1));
    costfun_values(iteration,1)       = eval(subs(Fun,s_values(iteration)));
    error_costfunction    = abs(costfun_values(iteration,1) - costfun_values(iteration-1,1)); % delta f*(x) = |f(x(k)) - f(x(k-1))|;
end
closest_x = funx(s_values(iteration, 1));
closest_y = funy(s_values(iteration, 1));
end