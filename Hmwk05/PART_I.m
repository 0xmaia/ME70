%Maia Taffe
%March 10, 2021
%Simulates a test signal as a sine wave of 0.15 volt amplitude at 1 Hz.
%Utilizes the diff funtion to generate discrete derivative plots. Compares
%plots of the discrete derivative of the test signal versus the analytic
%derivative for the case of Arduino Uno and Arduino Zero. Comments on the
%performance of the cases and recommends a device for tracking velocity of
%a potentiometer that can be powered with 5.0 volts or 3.3 volts.

%clear from previous files
clear, clc

%PART I: Analysis
%Problem 1

%Arduino Uno
%An Arduino Uno system has a 10-bit resolution with a 5.0 volt range
delT = 0.0001;  %define a unrealistically fast sample time
t = 0:delT:10;  %define a time vector spaced by delT, from 1 to 10 seconds
Amplitude = .15;     %let's consider a 0.15 volt amplitude at 1 Hz
maxVolt = 5.0;  %the max voltage for an Arduino Uno is 5 volts
bitCapacity = 2^10;     %10-bits is the capacity of an Aurduino Uno
xsim = Amplitude*sin(t*1*2*pi) + Amplitude;     %analytic perfect sine wave at 1 Hz, offset to only have positive values
vsim = Amplitude*cos(t*1*2*pi)*2*pi;    %analytic derivative of sine wave

%xsim/maxvolt is the normalized voltage --> range from 0 to 1
%(bitCapacity - 1) scaled the normalized voltage --> range from 0 to 2^n
%round forces data into discrete integer bins --> integer from 0 to 2^n
%divide by (bitCapacity - 1) t0 get back into volt units
xquant = round((bitCapacity - 1)*xsim/maxVolt)*maxVolt/(bitCapacity - 1);   %quantized version of test signal

%resample time and xquant to something more reasonable
%new tdelta is 0.1
tnew = t(1:100:end);
xquantnew = xquant(1:100:end);

%check number of possible elements, try test amplitude as big as maxVolts
length(unique(xquant))

figure(1)
subplot(2,1,1)
hold on
plot(t,xsim)
plot(t,xquant)
ylabel('ADC (volts)')
title('Arduino Uno')

subplot(2,1,2)
hold on
%compare analytic derivative to discrete derivative from quantized data
plot(tnew(1:end - 1),diff(xquantnew)/0.01)
plot(t,vsim)
xlabel('time (sec)')
ylabel('deriv (volts/sec)')

%Arduino Zero
%Arduino Zero system has a 12-bit resolution with a 3.3 volt range
delT = 0.0001;  %define a unrealistically fast sample time
t = 0:delT:10;  %define a time vector spaced by delT, from 1 to 10 seconds
Amplitude = .15;     %let's consider a 0.15 volt amplitude at 1 Hz
maxVolt = 3.3;  %the max voltage for an Arduino Zero is 3.3 volts
bitCapacity = 2^12;     %12-bits is the capacity of an Aurduino Zero
xsim = Amplitude*sin(t*1*2*pi) + Amplitude;     %analytic perfect sine wave at 1 Hz, offset to only have positive values
vsim = Amplitude*cos(t*1*2*pi)*2*pi;    %analytic derivative of sine wave

%xsim/maxvolt is the normalized voltage --> range from 0 to 1
%(bitCapacity - 1) scaled the normalized voltage --> range from 0 to 2^n
%round forces data into discrete integer bins --> integer from 0 to 2^n
%divide by (bitCapacity - 1) t0 get back into volt units
xquant = round((bitCapacity - 1)*xsim/maxVolt)*maxVolt/(bitCapacity - 1);   %quantized version of test signal

%resample time and xquant to something more reasonable
%new tdelta is 0.1
tnew = t(1:100:end);
xquantnew = xquant(1:100:end);

%check number of possible elements, try test amplitude as big as maxVolts
length(unique(xquant))

figure(2)
subplot(2,1,1)
hold on
plot(t,xsim)
plot(t,xquant)
ylabel('ADC (volts)')
title('Arduino Zero')

subplot(2,1,2)
hold on
%compare analytic derivative to discrete derivative from quantized data
plot(tnew(1:end - 1),diff(xquantnew)/0.01)
plot(t,vsim)
xlabel('time (sec)')
ylabel('deriv (volts/sec)')

fprintf('The Arduino Zero performed better than the Arduino Uno becuase the analytic derivative and discrete derivative are more aligned with one another.\n');
fprintf('I recommend the Arduino Zero for tracking velocity of the potentiometer becuase there are more bits so there will be a higher resolution.\n');