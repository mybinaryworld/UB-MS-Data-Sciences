syms theta
figure 
fplot(theta,[0,1],'g')
legend()
hold on
fplot(sin(theta),[0,1],'r')
hold on
root = fzero(@(x)(sin(x)-(x/1.05)),[0.01,1]);
y=linspace(0,3,50);
plot(y.*0+root,y,'b')