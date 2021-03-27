%Maia Taffe
%March 3, 2021
%Utilizing the diff function to calculate partial derivatives of the
%strain, epsilon, with respect to the variable F, b, h, L in order to
%calculate the total 'typical' uncertainty of epsilon.

%clear from previous files
clear, clc

%PART I: Analysis
%Problem 1

%the strain, epsilon, in a cantilever beam is represented as epsilon = (6*F*L)/(E*b*h^2)
syms F L E b h
epsilon = 6*F*L/(E*b*h^2);

%Y = diff(X,n) calculates the nth difference by applying the diff(x)
%operator recursively n times
d_epsilon_dF = diff(epsilon, F)
d_epsilon_db = diff(epsilon, b)
d_epsilon_dh = diff(epsilon, h)
d_epsilon_dL = diff(epsilon, L)

%Measurement uncertainties (+/-)
w_F = 0.1;
w_b = 0.001;
w_h = 0.0005;
w_L = 0.01;

%Calculation of the total 'typical' uncertainty w_epsilon
w_epsilon = ((w_F*d_epsilon_dF)^2 + (w_b*d_epsilon_db)^2 + (w_L*d_epsilon_dL)^2 + (w_h*d_epsilon_dh)^2)^(1/2)



