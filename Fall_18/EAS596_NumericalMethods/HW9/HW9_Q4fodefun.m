function dydt = HW9_Q4fodefun(t,y)
dydt = zeros(2,1);
dydt(1) = y(2);
dydt(2) = -9.81*y(1);