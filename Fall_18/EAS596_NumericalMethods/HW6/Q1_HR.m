function [Q,R] = Q1_HR(A)
    [m,n] = size(A);
    R =A;
    Q =eye(m);
    for k=1:n
        normx = norm(R(k:end,k));
        x = R(k,k) - sign(R(k,k))*normx;
        y = R(k:end,k)/x;
        y(1) = 1;
        t = -sign(R(k,k))*x/normx;
        R(k:end,:) = R(k:end,:) - (t*y)*(y'*R(k:end,:));
        Q(:,k:end) = Q(:,k:end) - (Q(:,k:end)*y)*(t*y)';
    end
end