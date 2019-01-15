clear all
clc

%2b.i) Importing the Theta values
thetaData=load('theta1', '-mat');
thetaVal = thetaData.t_theta;
time=(thetaVal(1,:));
theta1=(thetaVal(2,:));

%2b.ii) calculating the roots for theta2 and x using newton solver
Jacobian = @(x) [1 0.75*sin(x(2));0 1];
maxIter = 100000;
tol = 10^-6;
intial= [1.5 1];
f = @Function;
ls = [];
for i = 1:20
    theta1Value = theta1(i);
    [coeff, count] = newtonNonUniform(f,Jacobian,intial',maxIter,tol,theta1Value);
    ls=[ls,coeff];
end

%2.b(iii) plotting for displacement and time
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

%2.b(iv)
% calculating the velocity and acceleration 
velocity = derivative(ls(1,:),time);
acceleration = derivative(velocity,time);

%2.b(v)
%Plot force vs Displacement
figure()
plot(ls(1,:),10*acceleration);
xlabel('Displacement');
ylabel('Force');
title('Force vs Displacement')

%2.b(vi)
%calculating work done
workdone = 10 * trapz(ls(1,:), acceleration)
%workdone is -29.5930

%Non-Linear system of Equation
function root = Function(x,theta11)
L1 = 0.5;
L2 = 0.75;
h = 0;
root(1) = x(1) - L1*cos(theta11) - L2*cos(x(2));
root(2) = x(2) - asin((h - L1*sin(theta11))/L2);
end


