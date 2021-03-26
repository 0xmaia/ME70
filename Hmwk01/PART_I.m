%Maia Taffe
%February 8, 2021
%Estimates the systematic error, maximum random error, and average
%magnitude (typical) of random error according to the true value of boiling
%water, 100 degrees celsius, and the mean function to calculate the average
%of all the TMP36 temperature sensor readings.

%clear from previous files
clear, clc

%PART I: Analysis
%Problem 1
%Given Information
temp = [98.1 101.2 99.5 100.1 100.3 99.4 98.9];     %TMP36 temperature sensor readings for boiling water (in degrees celsius)
true = 100;     %true temperature of boiling water (in degrees celsius)

average = mean(temp);   %average reading temperature

%Part (a)
systematicError = average - true    %systematic error

%Part (b)
randomError = abs(temp - average);  %random error (absolute value)
maxRandomError = max(randomError)   %maximum random error

%Part (c)
typical = mean(randomError)     %average magnitude (typical) of random error

%Part (d)
%The differences in why it might be useful to know (a), (b), and (c) is 
%systematic and random errors both degrade the validity of the data. It
%might be useful to know the systematic error because the consistent,
%repeatable error affects the accuracy. While it useful to know the random
%error because tbe a lack of repeatability in the output of the measuring
%system affects the precision. The maximum random error is the reading that
%deviates the most from the average reading so the average magnitude
%(typical) of random error is the average of all the deviations (absolute
%value) from the average reading.