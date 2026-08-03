clc,clear;
syms z
eqn1 = 5*z^2 - 2*z + 2;
Z = solve(eqn1)
%stable




syms x
eqn2 = x^3-0.2*x^2-0.25*x + 0.05;
X = solve(eqn2)
%stable




syms y
eqn3 =  y^3-0.2*y^2-0.25*y + 0.05;
Y = solve(eqn3)
%stable



syms a
eqn4 = a^4 + 2.5*a^3 + 2.1*a^2 - 0.5*a + 0.04;
A = solve(eqn4)
%unstable



syms b
eqn5 = -b^3 +3.6*b^2-4*b+1.6;
B = solve(eqn5)
%unstable








