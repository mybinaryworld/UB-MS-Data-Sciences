%secondDer_Order2
x = linspace(0, 2*pi, 10);
funcitonvalues = sin(x);
h = 2*pi/9;
sec_order_2 = secondDer_Order2(funcitonvalues, h);
figure
plot(x,sec_order_2,'g')
hold on;
plot(x, -1*sin(x),'r')
title("Second derivative order 2")
xlabel("step size")
ylabel("-sin(x)")


%4th order
%sec_order_4 = secondDer_Order2(sec_order_2, h);
sec_order_4 = secondDer_Order4(funcitonvalues, h);
figure
plot(x,sec_order_4,'g')
hold on;
plot(x, -1*sin(x),'r')
title("Second derivative order 4")
xlabel("step size")
ylabel("-sin(x)")