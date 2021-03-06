# Homework 4
*ME70 Instruments and Experiments*

## PART I
We wish to determine how uncertainties in the measurement of physical variables in a cantilever beam will affect the computation of strain. Use the MATLAB command 'syms' to make symbolic variables for each of the terms in the strain equation for a cantilever beam. Use the command 'diff' to calculate partial derivatives of the strain with respect to the variables F, b, h, L from the equation below.

![alt text](https://github.com/0xmaia/Images/blob/main/ME70_Hmwk04_Image1.jpg)

Assume the uncertainty of modulus E is effectively negligible, and the measurement uncertainties are w_F = 0.01 N, w_b = 0.01 m, w_h = 0.0005m, w_L = 0.01 m (negative and positive). Calculate the total "typical" uncertainty w_strain.

![alt text](https://github.com/0xmaia/Images/blob/main/ME70_Hmwk04_Image2.jpg)

## PART II
Make a labview program that reads a date stream so that you can:
+ separately identify both high and low events (maxima and minima)
+ appends arrays to indentify the time index and value of the data for each event

Use the SymPulseSignal text file as the data stream.
