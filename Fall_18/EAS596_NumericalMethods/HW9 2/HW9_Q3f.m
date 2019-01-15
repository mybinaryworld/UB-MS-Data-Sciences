error2 = zeros(1,length(100));
error4 = zeros(1,length(100));
for i = 100:100:10000
   steps(i/100) = 2*pi/i;
   h = (2*pi)/(i);
   x = linspace(0, 2*pi, i);
   y = sin(x);
   values = -sin(x);
   der2order = secondDer_Order2(y,h);
   der4order = secondDer_Order4(y,h);
   error2(i/100) = max(values - der2order);
   error4(i/100) = max(values - der4order);
end

 %plotting the log log
 figure
 loglog(steps,error2,'b')
 xlabel('step size')
 ylabel('error')
 hold on;
 %plotting the log log
 
 loglog(steps,error4,'r')
 xlabel('step size')
 ylabel('error')