function secondOrderDerivative4 = secondDer_Order4(funvalues, h)
    sec_order2 = secondDer_Order2(funvalues,h);
    sec_order4 = secondDer_Order2(sec_order2,h);
    secondOrderDerivative4 = sec_order2 - sec_order4*h^2/12;
end