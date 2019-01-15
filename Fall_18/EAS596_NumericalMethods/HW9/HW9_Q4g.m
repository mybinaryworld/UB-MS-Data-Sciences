[t,y] = ode45('HW9_Q4fodefun',[0 25], [(45/180)*pi 0]);
f = (45/180)*pi*cos(sqrt(9.81)*t);
figure
plot(t,y(:,1),'r-');
ylabel('\theta(t)')
xlabel('time')
hold on
plot(t,f,'g-');
legend('numerical solution','analytical solution')