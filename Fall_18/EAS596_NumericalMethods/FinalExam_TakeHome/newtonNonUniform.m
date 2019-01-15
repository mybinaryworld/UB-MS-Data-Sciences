%Newton raphson method for solving non-linear system of equation
function [root,iter] = newtonNonUniform(f,Jacobian,intialGuess,maxIterations,tolerance,theta1)
iter = 0;
root = intialGuess;
error = 10000;

while (error > tolerance) && (iter <= maxIterations)
    iter = iter +1;
    root = root - Jacobian(root)\f(root,theta1)';
    error = abs(norm(f(root,theta1))/norm(f(intialGuess,theta1)));
end