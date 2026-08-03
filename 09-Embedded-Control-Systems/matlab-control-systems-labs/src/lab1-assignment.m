% Name: Abdelrhman Mohamed Abdelhady Hodib ID: 2022513643

% 1st Question: the transfer from the S domain to the Z domain

% Define the continuous-time transfer function G(s)
num = 1;
den = [1, 10, 20];
% Define the sample times
Ts1 = 1/10;
Ts2 = 1/100;
% Frequency response of the systems
w = linspace(0, pi, 1000); % Define the frequency range
% Continuous system frequency response
h = freqs(num, den, w);
Gd1 = c2d(tf(num, den), Ts1, 'zoh');
Gd2 = c2d(tf(num, den), Ts2, 'zoh');
% Discrete system frequency response at Ts1 and Ts2
[num1, den1] = tfdata(Gd1, 'v');
[num2, den2] = tfdata(Gd2, 'v');
[h1, w1] = freqz(num1, den1, w);
[h2, w2] = freqz(num2, den2, w);
% Plot the frequency response
figure;
plot(w, 20*log10(abs(h)), 'yellow', 'LineWidth', 2);
hold on;
plot(w1, 20*log10(abs(h1)), 'black', 'LineWidth', 2);
plot(w2, 20*log10(abs(h2)), 'blue', 'LineWidth', 2);
title('Frequency Response');
xlabel('Frequency (radians/sample)');
ylabel('Magnitude (dB)');
legend('Continuous System', ['Discrete System @ Ts=', num2str(Ts1), ' sec'], ['Discrete System @ Ts=', num2str(Ts2), ' sec']);
grid on;

%___________________________________________________________________________

% 2nd_Question

% The Z transform of unit step fn
syms t z k;
%the unit step function u(t-k)
u_k = heaviside(t - k);
Uz_k = ztrans(u_k, t, z);
% Display the Z-transform
disp('Z-transform of u(t-k):');
pretty(Uz_k); % Pretty is just a function used to view the transform in a good way

