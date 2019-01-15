[t45,x45] = ode45('odefun',[0,5],4);
[t23,x23] = ode23s('odefun',[0,5],4);

disp(length(t45))
disp(length(t23))
%ode45 took 4245 steps while ode23s took 141 steps as expected.