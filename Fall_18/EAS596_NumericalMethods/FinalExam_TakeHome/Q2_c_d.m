clear all
clc
%2.c
thetaData=load('theta1', '-mat');
theta1Data = thetaData.t_theta;
time=(theta1Data(1,:));
theta1=(theta1Data(2,:));
c = [0 0];
f = @(c,time)(c(1).*time)./(time+c(2));
c = lsqcurvefit(f,c,time,theta1)
fittheta1 = f(c,time);

figure()
plot(time,theta1,'*-',time,fittheta1,'r-');
xlabel('Time');
ylabel('theta1');
legend('Data', 'Fitted curve');
title('Curve Fit');

theta1=(c(1).*time)./(time+c(2));
%Value of coefficients are 6.2185 and 0.9826

%2.d(ii) calculating the roots for theta2 and x using newton solver
Jacobian = @(x) [1 0.75*sin(x(2));0 1];
ls = [];
maxIter = 100000;
tol = 10^-6;
intial= [1.5 1];
f = @Function;
for i = 1:20
    theta1Value = theta1(i);
    [roots, count] = newtonNonUniform(f,Jacobian,intial',maxIter,tol,theta1Value);
    ls=[ls,roots];
end

%2.d(iii) plotting for displacement and time
figure()
subplot(3,1,1)
plot(time,theta1)
xlabel('Time');
ylabel('Theta1');
title('theta1 vs time')
subplot(3,1,2)
plot(time,ls(2,:))
xlabel('Time');
ylabel('Theta2');
title('theta2 vs time')
subplot(3,1,3)
plot(time,ls(1,:))
xlabel('Time');
ylabel('displacement');
title('Displacement vs time')

%2.d(iv)
% calculating the velocity and acceleration 
velocity = derivative(ls(1,:),time);
acceleration = derivative(velocity,time);

%2.d(v)
%Plot force vs Displacement
figure()
plot(ls(1,:),10*acceleration);
xlabel('Displacement');
ylabel('Force');
title('Force vs Displacement')

%2.d(vi)
%calculating work done
workdone = 10 * trapz(ls(1,:), acceleration)
%workdone is -29.5930

%Non-Linear system of Equation
function F = Function(x,theta11)
L1 = 0.5;
L2 = 0.75;
h = 0;
F(1) = x(1) - L1*cos(theta11) - L2*cos(x(2));
F(2) = x(2) - asin((h - L1*sin(theta11))/L2);
end