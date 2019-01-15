%(ii)
A = [1/3, 1/3, 2/3;
    2/3, 2/3, 4/3;
    1/3, 2/3, 3/3;
    2/5, 2/5, 4/5;
    3/5, 1/5, 4/5;];

rank(A)
[U, S, V] = svd(A);

%The machine epsilon for double precision is 2.2e-16. So any singular 
%values above this range should be neglected as it is probabily due to
%rounding and truncation error. Here if we calculate the SVD of A and check
%its singular values we see that the 3rd singular value is 1.9261e-16,
%which is certainly due to machine precision error. So we should
%take the rank to be 2.


%(iii)
% We'll use similar concept in this situation too. If we assume infinite
% precision, this matrix will have a full rank but if we take into account
% the double precision, we should limit the rank of A. We should consider
% only those singular values that lies within the range of the machine
% precision. In this case 0.9^327=1.08072e-15. So our rank should be 327
% but if we form a diagonal matrix with these singular values and compute
% the rank, we get rank(A) = 276. This lower than expected rank is due to
% increase in error due to further matrix manupulation. 


y = 0.9.^((1:n));
dia = y.*eye(2000,2000);
rank(dia)
