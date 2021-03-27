%Maia Taffe
%February 24, 2021
%Utilizes anova1, ttest2, and regress functions to determine whether there
%is  significant difference between measurements for fruit categories and
%to plot the raw data along with a linear regression line.

%clear from previous files
clear, clc

%PART I: Analysis
%Problem 1

data = readtable('ME70_FruitData', 'PreserveVariableNames', true);     %read spreadsheet data into a table
fruitData = table2array(data);
day = fruitData(1:20,1);
apples = fruitData(1:20,2);
oranges = fruitData(1:20,3);
pears = fruitData(1:20,4);


%boxplot(x) creates a box plot of the data in x
%On each box, the central mark indicates the median, and the botom and top
%edges of the box indicate the 25th and 75th percentiles, respectively. The
%whiskers extend to the most extreme data points not considered outliers,
%and the outliers are plotted individually using the '+' symbol.
figure(1)
boxplot([apples oranges pears],{'Apples', 'Oranges', 'Pears'})
title('Mass Measurements of Fruit Taken Across 5 Days')
xlabel('Fruit')
ylabel('Mass Measurements')

%p = anova1(y) performs one-way ANOVA for the sample data y and returns the
%p-value.
fruitDataExtracted = fruitData(1:20,2:4);
p = anova1(fruitDataExtracted, {'apples', 'oranges', 'peaches'})
fprintf('An ANOVA test was performed first to see if there is a general effect of each factor. Must continue with t-tests to make a final claim\n');

%T-Test2 used to test whether two collections of data have a different mean
%Test between apples and oranges
[h1,p1] = ttest2(apples, oranges)

%Test between oranges and pears
[h2,p2] = ttest2(oranges, pears)

%Test between apples and pers
[h3,p3] = ttest2(apples, pears)

%Bonferroni Correction
correctedp1 = p1 * 3
correctedp2 = p2 * 3
correctedp3 = p3 * 3

fprintf('Looking at the corrected p-values, there is a significant difference between measurements for oranges and pears, and apples\n');
fprintf('and pears. This is because the corrected p-value for apples and oranges is, %f , which is greater than 0.05 threshold. \n', correctedp1);
fprintf('While the corrected p-value for oranges and pears, and apples and pears is %f and %f, respectively. \n', correctedp2, correctedp3)

%x = ones(sz1,...,szN) returns an sz1-by-szN array of ones where sz1,...szN
%indicates the size of each dimension
ones = ones(60,1);  %(60,1) --> (rows,columns)

%C=cat(dim,A1,A2,...,An) concatenates A1, A2,.., An along dimension dim
XDATA = cat(1, day, day, day);
XDATA = horzcat(XDATA, ones);   %For the software to compute the model statistics for the linear regression correctly, the xdata must contain a column of ones
YDATA = cat(1, apples, oranges, pears);

%[b,bint,r,rint,stats] = regress(y,X) returns a vector stats that contains
%the R^2 statistic, the F-statistic and its p-value, and an estimate of the
%error variance
[b,bint,r,rint,stats] = regress(YDATA, XDATA)
fprintf('R-square is %f\n', stats(1));
fprintf('p-value is %f\n', stats(3));

%linear model ymod=m*xdata+B
ymod = b(1)*XDATA(1:60,1)+b(2);

%scatter(x,y) creates a scatter plot with circles at the locations
%specified by the vectors x and y
figure(4)
scatter(XDATA(1:60,1), YDATA)   %Column of ones removed to make the scatter plot
hold on
plot(XDATA(1:60,1), ymod)
title('Mass Measurements for 3 Kinds of Fruit Taken Across 5 Days')
xlabel('Measurement Days')
ylabel('Mass Measurements')
hold off




