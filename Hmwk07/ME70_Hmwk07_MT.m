%Maia Taffe
%March 31, 2021
%Determines the histograms, one-dimensional models, and two dimensional
%models for collected cursor motion.

%Clear from previous files
clear
close all

%PART I: Analysis
%Problem 1

%For loop to get new mouse data
'Make small scribbles with the cursor for 30 seconds'
'Collecting mouse data'
for ii=1:1000
 yy(ii,:)=get(0, 'PointerLocation');
 tt(ii,:)=(ii-1)*.01; %Time
 pause(0.01)
 end
'Collection done'
 
%x and y data definition
xdata=yy(:,1);
ydata=yy(:,2);
 
%Obtain covariance matrix data and get standard deviations, means, and
%correlation.
Sigma=cov(yy);
sigma_x=sqrt(Sigma(1,1));
sigma_y=sqrt(Sigma(2,2));
rho=Sigma(1,2)/(sigma_x*sigma_y);
 
mu_x=mean(xdata);
mu_y=mean(ydata);
 
%Linear span for domains of x and y, 20 points between min and max
xrange=linspace(min(xdata),max(xdata),20);
yrange=linspace(min(ydata),max(ydata),20);
 
 
%Task 1:
%one dimensional normal distributions for the data along the x and y axes
%xrange and yrange will be the input domains
%mu_x, mu_y, sigma_x, and sigma_y will be parameters set from above 
 
px=1/(sigma_x*sqrt(2*pi))*exp(-.5*((xrange-mu_x)./(sigma_x)).^2);
py=1/(sigma_y*sqrt(2*pi))*exp(-.5*((yrange-mu_y)./(sigma_y)).^2);

%Grid of x and y domains
[xgrid, ygrid]=ndgrid(xrange, yrange);
 
%Task 2:
%a two dimensional normal distribution for the data along the x and y axes
%xgrid and ygrid will be the input domains
%mu_x, mu_y, sigma_x, and sigma_y will be parameters set from above
 
%2D normal distribution
Cxy=zeros(20,20);
Cxy = -(1/(2*(1-rho^2)).*((((xgrid-mu_x).^2)/sigma_x^2)+(((ygrid-mu_y).^2)/sigma_y^2)-((2*rho*(xgrid-mu_x).*(ygrid-mu_y))/(sigma_x*sigma_y))));
pxy=1/(2*pi*sigma_x*sigma_y*sqrt(1-rho^2))*exp(Cxy);
 

figure(1)
subplot(331)
plot(tt,xdata)
 ylim([min(xdata) max(xdata)])
xlabel('Time')
ylabel('Xdata')
 
subplot(332)
hist(xdata,20)
xlabel('Xdata')
ylabel('Counts')
 
subplot(333)
plot(xrange, px)
xlabel('Xdata')
ylabel('Prob')
 
 
subplot(334)
plot(tt,ydata)
xlabel('Time')
ylabel('Ydata')
 
 
ylim([min(ydata) max(ydata)])
 
subplot(335)
hist(ydata,20)
xlabel('Ydata')
ylabel('Counts')
 
 
subplot(336)
plot(yrange, py)
xlabel('Ydata')
ylabel('Prob')
 
 
subplot(337)
plot(xdata,ydata)
axis equal
 
xlabel('Xdata')
ylabel('Ydata')
 
%axis square
xlim([min(xdata) max(xdata)])
ylim([min(ydata) max(ydata)])
 
 
subplot(338)
histogram2(xdata, ydata,20, 'facecolor', 'flat')
axis equal
view(2)
xlim([min(xdata) max(xdata)])
ylim([min(ydata) max(ydata)])
%axis square
%view(3)
xlabel('Xdata')
ylabel('Ydata')
 
subplot(339)
surf(xgrid,ygrid,pxy)
view(2)
axis equal
xlim([min(xdata) max(xdata)])
ylim([min(ydata) max(ydata)])
%axis square
xlabel('Xdata')
ylabel('Ydata')

fprintf('We assumed the raw data is a normal distribution but the results show it is normal for the random pattern and not normal for the circular pattern.\n')