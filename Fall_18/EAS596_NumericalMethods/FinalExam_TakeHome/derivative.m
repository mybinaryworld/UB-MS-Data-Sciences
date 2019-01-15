%Function which calculates first derivative for non uniform gr
function df = derivative(x, t)
df = zeros(1,length(x));
df(1)=(x(2)-x(1))/(t(2)-t(1));
df(length(x))=(x(length(x))-x(length(x)-1))/(t(length(x))-t(length(x)-1));
for i = 2:length(x) -1
    h1 = t(i+1)-t(i);
    h0 = t(i)-t(i-1);
    df(i) = (-1*h1*x(i-1)/(h0*(h0+h1))) ...
            + ((h1-h0)*x(i)/(h0 * h1)) ...
            + (h0 * x(i+1)/(h1*(h0+h1)));
end
end