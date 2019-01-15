function [Q,R] = Q1_ModifiedGS(A)
    [m,n] = size(A);
    Q = zeros(m,n);
    R = zeros(n,n);
    for j=1:n
        Q(:,j) = A(:,j);
    end
    for i = 1:n
        R(i,i) = norm(Q(:,i));
        Q(:,i) = Q(:,i)/R(i,i);
        for j= i+1:n
            R(i,j) = Q(:,i)'*Q(:,j);
            Q(:,j) = Q(:,j) - R(i,j)*Q(:,i);
        end
    end
end
