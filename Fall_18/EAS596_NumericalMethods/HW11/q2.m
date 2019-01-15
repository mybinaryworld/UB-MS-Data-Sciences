clear; close; clc;

x5 = linspace(-1, 1, 5);
x11 = linspace(-1, 1, 11);
x21 = linspace(-1, 1, 21);

y5 = Runge(x5);
y11 = Runge(x11);
y21 = Runge(x21);

x = linspace(-1, 1, 1000);

% (a)
figure;
hold on;
plot(x, Lagrange(x, x5, y5));
plot(x, Lagrange(x, x11, y11));
plot(x, Lagrange(x, x21, y21));
plot(x, Runge(x));

xlabel("X");
ylabel("Y");
legend("5-points", "11-points", "21-points", "Actual");
title("Runge's function with Lagrange's interpolation");
axis([-1 1 -2 2]);


% (b)
x = linspace(-1, 1, 1000);
lin5 = interp1(x5, y5, x, 'linear');
lin11 = interp1(x11, y11, x, 'linear');
lin21 = interp1(x21, y21, x, 'linear');

figure;
hold on;
plot(x, lin5);
plot(x, lin11);
plot(x, lin21);
plot(x, Runge(x));
title("Runge's function with Linear interpolation");
xlabel("X");
ylabel("Y");
legend("5-points", "11-points", "21-points", "Actual");

% (c)
x = linspace(-1, 1, 1000);
lin5 = interp1(x5, y5, x, 'pchip');
lin11 = interp1(x11, y11, x, 'pchip');
lin21 = interp1(x21, y21, x, 'pchip');

figure;
hold on;
plot(x, lin5);
plot(x, lin11);
plot(x, lin21);
plot(x, Runge(x));
title("Runge's function with Cubic interpolation");
xlabel("X");
ylabel("Y");
legend("5-points", "11-points", "21-points", "Actual");
