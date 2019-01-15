function secondOrderDerivative = secondDer_Order2(funvalues, h)
    secondOrderDerivative = zeros(1, length(funvalues));
    for i = 2:length(funvalues)-1
        secondOrderDerivative(i) = (funvalues(i+1) - 2*funvalues(i) + funvalues(i-1))/(h*h);
    end
        secondOrderDerivative(1) = (funvalues(length(funvalues)-1) - 2*funvalues(1) + funvalues(2))/(h*h);
        secondOrderDerivative(length(funvalues)) = (funvalues(length(funvalues)-1) - 2*funvalues(1) + funvalues(2))/(h*h);
end