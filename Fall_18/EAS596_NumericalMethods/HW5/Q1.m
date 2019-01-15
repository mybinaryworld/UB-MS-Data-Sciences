y = logspace(-16,-1, 16);
error = zeros(1,16);
for i = 1:size(y,2)
  error(1,i) = abs(cos(pi/3) - (sin(pi/3 + y(i)) - sin(pi/3))/y(i));
end
loglog(y,error,'o')
xlabel('step-size')
ylabel('error')
grid on