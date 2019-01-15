function integral_value = gauss_quad( func, x_start, x_end, num_points )

n = num_points;
h = ( x_end - x_start )/( n - 1 );

% Constructing grid points.
x = [ x_start : h : x_end ];

c1=0.5*h*(1-1/sqrt(3));
c2=0.5*h*(1+1/sqrt(3));
    
% Intialize integration to zero
integral_value = 0;
for i = 1:n-1
    integral_value = integral_value+func(x(i)+c1)+func(x(i)+c2);
end

integral_value = integral_value * h/2;