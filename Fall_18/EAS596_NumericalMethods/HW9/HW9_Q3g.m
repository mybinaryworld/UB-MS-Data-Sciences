clear
for p = 2:2:8
    for i = 100:100:10000
    steps(i/100) = (2*pi/(i-1));
    h = (2*pi)/(i-1);
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
 
%In all of the graphs we see that the 4th order underperforms than second
%order in approximating the 2nd order derivative when the data has noise.
%This is because the 4th order approximation amplifies the noise more
%as compared to 2nd order while computing the derivative. Thus the error is
%more for 4th order approximation