%Maia Taffe
%February 16, 2021
%Utilizes estimated time constants to generate simulated time responses.
%Final comparison of results to curves a, b, and c provided in the TPC 12.
%Thermal Response Time in Still Air graph.

%clear from previosu files
clear, clc

%PART I: Analysis
%Problem 1

%the time constant is tau at 63.2% speed
tau_a = 45    %the time constant for curve (a)
tau_b = 50;     %the time constant for curve (b)
tau_c = 115;    %the time constant for curve (c)


time = 5*tau_a   %time required for the TMP36 to reach a static approximation

A = 99.3;    %constant, shouldn't approximate as 100%

%steps taken to compute the percent of change
%tau_c was since it was the largest tau of the three time responses
t = 0:1:5*tau_c;    

%the exponential rise equation is y=A*(1-e^(-t/tau))
%y is the percent of change in speed
y_a = A*(1-exp(-t/tau_a));  %computing the y values for curve (a)
plot(t,y_a);    %plot for curve (a)
hold on;

y_b = A*(1-exp(-t/tau_b));  %computing the y values for curve (b)
plot(t,y_b,'--');   %plot for curve (b)
hold on;

y_c = A*(1-exp(-t/tau_c));  %computing the y values for curve (c)
plot(t,y_c);    %plot for curve (c)
hold off;

legend('a','b','c', 'Location', 'southeast');
ylabel('V_c, percent of change (%)');
xlabel('Time (sec)');
title('Simulated Time Responses');

%The generated simulated time responses are very similar to the curves a, b
%and c. The general shapes are similar, but my results diverge quicker than
%a, b, and c on the provided graph. Also, a, b, and c on the provided graph
%converge slightly earlier than my results. This is partly due to having to
%make approximations on tau for a, b, and c.