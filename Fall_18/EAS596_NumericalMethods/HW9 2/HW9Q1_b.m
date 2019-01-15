%1ST PART 
syms x
%Fourier transform for sin^2(x)
ao =  1/pi*int((sin(x)).^2,x,[-pi,pi]);
%As sin^2(x) is an odd function 'bn'=0, so calculating just 'an'
f = 0;
for n=1:5
    an =  (1/pi)*int(((sin(x)).^2)*cos(n*x),x,[-pi,pi]);
    f = f + an*cos(n*x);
end
f = f + ao/2;
figure
fplot(f,[-pi,pi],'b')
hold on
fplot(sin(x).^2,[-pi,pi], 'g')
title("Approximation for N=5")
xlabel("x")
ylabel("\sin(x)^2")


%for n=100
f=0;
for n=1:100
    an =  (1/pi)*int(((sin(x)).^2)*cos(n*x),x,[-pi,pi]);
    f = f + an*cos(n*x);
end
f = f + ao/2;
figure
fplot(f,[-pi,pi],'b')
hold on
fplot(sin(x).^2,[-pi,pi], 'g')
title("Approximation for N=100")
xlabel("x")
ylabel("\sin(x)^2")


%2ND PART 
syms x
%Fourier transform for sin^2(x)
aao =  1/pi*(int(x+pi,x,[-pi,0]));
abo = 1/pi*int(x,x,[0,pi]);
%As sin^2(x) is an odd function 'bn'=0, so calculating just 'an'
af = 0;
bf = 0;
for n=1:5
    aan =  (1/pi)*(int((x+pi)*cos(n*x),x,[-pi,0]));
    abn =  (1/pi)*(int(x*cos(n*x),x,[0,pi]));
    ban =  (1/pi)*(int((x+pi)*sin(n*x),x,[-pi,0]));
    bbn =  (1/pi)*(int(x*sin(n*x),x,[0,pi]));
    af = af + aan*cos(n*x) + ban*sin(n*x);
    bf = bf + abn*cos(n*x) + bbn*sin(n*x);
end
af = af + aao/2;
bf = bf + abo/2;
figure
fplot(af,[-pi,0],'b')
hold on
fplot(bf,[0,pi],'b')
hold on
fplot(x+pi,[-pi,0], 'g')
hold on
fplot(x,[0,pi], 'g')
title("Approximation for N=5")
xlabel("x")
ylabel("f2(x)")


%for n=100
af = 0;
bf = 0;
for n=1:100
    aan =  (1/pi)*(int((x+pi)*cos(n*x),x,[-pi,0]));
    abn =  (1/pi)*(int(x*cos(n*x),x,[0,pi]));
    ban =  (1/pi)*(int((x+pi)*sin(n*x),x,[-pi,0]));
    bbn =  (1/pi)*(int(x*sin(n*x),x,[0,pi]));
    af = af + aan*cos(n*x) + ban*sin(n*x);
    bf = bf + abn*cos(n*x) + bbn*sin(n*x);
end
af = af + aao/2;
bf = bf + abo/2;
figure
fplot(af,[-pi,0],'b')
hold on
fplot(bf,[0,pi],'b')
hold on
fplot(x+pi,[-pi,0], 'g')
hold on
fplot(x,[0,pi], 'g')
title("Approximation for N=100")
xlabel("x")
ylabel("f2(x)")

