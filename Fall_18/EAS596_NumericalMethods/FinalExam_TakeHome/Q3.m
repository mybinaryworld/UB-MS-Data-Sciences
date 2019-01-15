clear;
clc;
%Problem 3.d 
[x,fval] = fminbnd(@(s) sqrt((cos(s) - 4)^2 + ((sin(s) - 2))^2), 0,1);
q_xaxis = cos(x)
q_yaxis = sin(x)
% The value of (q_yaxis/q_xaxis) ~ 1/2 almost similar to the one we would
% get using the analytical solution where we calculated theta =
% atan(y/x) ~ 1/2 in this case.

%Problem 3.e % The function has been coded as newton_min method
[closest_x, closest_y] = newton_min(@(s)cos(s), @(s)sin(s), 0, pi*2, 0.5, 4,2)
%The point q calculated using newton's method is same as that calculated
%above i.e (q_xaxis, q_yaxis)

%Problem 3.f
%Initial Guess = 0
[closest_x_a, closest_y_a] = newton_min(@(s)(1+0.5*cos(4*s))*cos(s), @(s)(1+0.5*cos(4*s))*sin(s), 0, pi*2, 0, 1,1);

%Initial Guess = pi/2
[closest_x_b, closest_y_b] = newton_min(@(s)(1+0.5*cos(4*s))*cos(s), @(s)(1+0.5*cos(4*s))*sin(s), 0, pi*2, pi/2, 1,1);

%Initial Guess = 5*pi/4
[closest_x_c, closest_y_c] = newton_min(@(s)(1+0.5*cos(4*s))*cos(s), @(s)(1+0.5*cos(4*s))*sin(s), 0, pi*2, 5*pi/4, 1,1);

%Plotting the interface
s= linspace (0,2*pi);
X= (1+0.5.*cos(4*s)).*cos(s);
Y= (1+0.5.*cos(4*s)).*sin(s);
plot(X,Y)
hold on
plot(closest_x_a, closest_y_a,'r--*', closest_x_b, closest_y_b,'b--*', closest_x_c, closest_y_c,'g--o', 1, 1,'b--o')
xlabel('X axis');
ylabel('Y axis');
legend('Interface','q at sinitial =0', 'q at sinitial =pi/2', 'q at sinitial =5pi/4','Point P', 'location','northwest')
%In the plot we see that when initial guess is 0 we get a minimum which actually , when
%the initial guess is pi/2 we get a local maxima and when the initial guess
%is 5pi/4 we get a local minima. This confirms that a bad initial guess in
%the newton's method may not fetch us desired result like when initial
%guess is pi/2 and 5pi/4.
