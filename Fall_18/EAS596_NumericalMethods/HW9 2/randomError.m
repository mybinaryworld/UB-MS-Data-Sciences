function randomError(steps,error_sec,error_four,p)
% plotting the log log noise curve for second order
 figure
 loglog(steps,error_sec,'g')
 xlabel('step size')
 ylabel('error')
 hold on
 tempText = ['Error Order : ',num2str(p)];
 title(tempText)
 % plotting the log log for the noise curve fourth order
 loglog(steps,error_four,'r')
 xlabel('step size')
 ylabel('error')
end