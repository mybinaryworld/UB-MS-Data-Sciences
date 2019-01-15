warning off MATLAB:ezplotfeval:NotVectorized
x = [1.02, 0.95, 0.87, 0.77, 0.67, 0.56, 0.44, 0.3, 0.16, 0.01]';
y = [0.39, .32, 0.27, 0.22, 0.18, 0.15, 0.13, 0.12, 0.13, 0.15]';
noise = unifrnd(-0.005,0.005,10,2);

nx = x + noise(:,1);
ny = y + noise(:,2);

A = [y.^2, y.*x, x, y, ones(10,1)];
b = x.^2;

nA = [ny.^2, ny.*nx, nx, ny, ones(10,1)];
nb = nx.^2;

[U, S, V] = svd(A);
[nU, nS, nV] = svd(nA);
fh = @(x,y,coef) coef(1)*y^2 + coef(2)*x*y + coef(3)*x + coef(4)*y + coef(5) - x^2;

figure
for k=1:5
    %SVD without noise
    l_index = find(diag(S)<10^-k,1);
    if isempty(l_index)
        l_index = 5;
    else
        l_index = l_index-1;
    end
    [U_,S_,V_] = svds(A, l_index);
    b_ = U_'*b;
    S_ = S_*V_';
    coef = mldivide(S_, b_);
    subplot(2, 3, k) ;
    ez1 = ezplot(@(x,y)fh(x,y,coef),[-1,2,-0.5,1.5]), axis equal;
    set(ez1,'Color','red');
    hold on
    scatter(x,y)
    hold on
    
    %SVD with noise 
    l_index = find(diag(nS)<10^-k,1);
    if isempty(l_index)
        l_index = 5;
    else
        l_index = l_index-1;
    end
    [nU_,nS_,nV_] = svds(nA, l_index);
    nb_ = nU_'*nb;
    nS_ = nS_*nV_';
    ncoef = mldivide(nS_, nb_);
    ez2 = ezplot(@(x,y)fh(x,y,ncoef),[-1,2,-0.5,1.5]), axis equal;
    set(ez2,'Color','green');
    hold on
    scatter(nx,ny)
    legend('original ellipse','original point','noisy ellipse', 'noisy point')
    xlabel(['tolerance = ', num2str(10^-k), ' Singular values excluded :', num2str(5-l_index)]);
end