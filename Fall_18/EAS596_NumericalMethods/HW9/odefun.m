function dxdt = odefun(t,x)
dxdt = -700*x-1000*exp(-t);