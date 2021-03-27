# Homework 5
*ME70 Instruments and Experiments*

## PART I
An analog inout for an Arduino Uno system has 10-bit resolution with a 5.0 volt range, while and Arduino Zero has a 12-bit resolution with a 3.3 volt rance. A potentiometer can be powered with either system at 5.0 volts or 3.3 volts. Use MATLAB to simulate a test sgnal as a sine wave of 0.15 volt amplitude at 1 Hz. Make plots comparing the discrete derivative ('diff' or 'gradient') of the test signal versus the analytic derivative for the case of Uno versus zero. Comment on the performace of these cases and recommend a device for tracking velocity of the potentiometer.

## PART II
Make subvi functions to perform the following tasks:
+ Aligh and stack peak trajectories - this sub-vi takes in a 1-D array that containes a peak, pulls out a subset of the array that cotaines the peak located in the middle of the subset, and adds it on to previous peak arrays creating a 2-D array.
+ Compute mean and confidence interval of aligned trajectories - this sub-vi takes in the 2-D array of stacked peak arrays and computes a mean signal and confidence interval around the signal creating a 2-D array with three signals (the mean signal, the lower confidence interval and the higher confidence interval)

The main LabVIEW program should obtain the mean and confidence intervals for audio data representing a series of clap events.
