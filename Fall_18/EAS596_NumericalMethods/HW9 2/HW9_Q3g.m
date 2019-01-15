clear
for p = 2:2:8
    for i = 100:100:10000
    steps(i/100) = (2*pi/i);
    h = (2*pi)/(i);
    x = linspace(0, 2*pi, i);
    y = sin(x);
    ye = y + (2*(h^p)*(rand(size(y))+0.5));
    values = -sin(ye);
    der2order = secondDer_Order2(ye,h);
    der4order = secondDer_Order4(ye,h);
    error2(i/100) = max(values-der2order);
    error4(i/100) = max(values-der4order);
    end
 randomError(steps,error2,error4,p)
 end