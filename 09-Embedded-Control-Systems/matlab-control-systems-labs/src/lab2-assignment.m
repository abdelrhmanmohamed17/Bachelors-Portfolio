syms Z S T
% Name: Abdelrhman Mohamed Abdelhady Hodib ID: 2022513643

% 1st Question

% Define the transfer functions in the Z-domain
TF1 = Z / (Z^2 - sqrt(2)*Z + 1);
TF2 = Z * (1 - exp(-T))/( (Z-1) * (Z - exp(-T)) );
T = 0.1; % Value for T in the second transfer function
TF3 = (3*(Z^2) + 2*Z + 1) / (Z^2 - 3*Z + 2);

% Convert the transfer functions to Laplace (S-domain)
TF1_S = Z / (Z^2 - sqrt(2)*Z + 1);
TF2_S = Z * (1 - exp(-T))/( (Z-1) * (Z - exp(-T)) );
T = 0.1; % Value for T in the second transfer function
TF3_S = (3*(Z^2) + 2*Z + 1) / (Z^2 - 3*Z + 2);

% Define a range of frequencies for plotting
w = logspace(-2, 2, 100);

% Compute the magnitude and phase responses symbolically
Mag1 = abs(subs(TF1_S, Z, 1i*w));
Mag2 = abs(subs(TF2_S, {Z, T}, {1i*w, 0.1}));
Mag3 = abs(subs(TF3_S, Z, 1i*w));

Phase1 = angle(subs(TF1_S, Z, 1i*w));
Phase2 = angle(subs(TF2_S, {Z, T}, {1i*w, 0.1}));
Phase3 = angle(subs(TF3_S, Z, 1i*w));

% Plot the magnitude and phase
figure;
subplot(2, 1, 1); % Magnitude plot
semilogx(w, 20*log10(Mag1), 'black', 'LineWidth', 2);
hold on;
semilogx(w, 20*log10(Mag2), 'magenta', 'LineWidth', 2);
semilogx(w, 20*log10(Mag3), 'cyan', 'LineWidth', 2);
xlabel('Frequency (rad/s)');
ylabel('Magnitude (dB)');
title('Frequency Response (Magnitude)');
grid on;
legend('TF1', 'TF2', 'TF3');

subplot(2, 1, 2); % Phase plot
semilogx(w, rad2deg(Phase1), 'black', 'LineWidth', 2);
hold on;
semilogx(w, rad2deg(Phase2), 'magenta', 'LineWidth', 2);
semilogx(w, rad2deg(Phase3), 'cyan', 'LineWidth', 2);
xlabel('Frequency (rad/s)');
ylabel('Phase (degrees)');
title('Frequency Response (Phase)');
grid on;
legend('TF1', 'TF2', 'TF3');

% Adjust plot settings
set(gcf, 'Position', [100, 100, 800, 600]);

%__________________________________________________________________________

% Question2

% Define symbolic variables
syms Z k;

% Define the transfer functions
TF1 = 1 / (Z + 1);
TF2 = Z / (Z^2 - (1/sqrt(2))*Z + 0.25);
TF3 = Z / ((Z - 1)^2 * (Z - 2));

% Create an array of values for 'k'
k_values = linspace(0, 10, 100); % Adjust the range as needed

% Initialize arrays to store magnitude and phase data
magnitude_data = zeros(3, length(k_values));
phase_data = zeros(3, length(k_values));

% Loop through each 'k' value and calculate magnitude and phase for all transfer functions
for i = 1:length(k_values)
    k_value = k_values(i);
    TF1_k = subs(TF1, Z, k_value);
    TF2_k = subs(TF2, Z, k_value);
    TF3_k = subs(TF3, Z, k_value);
    
    magnitude_data(1, i) = abs(TF1_k);
    magnitude_data(2, i) = abs(TF2_k);
    magnitude_data(3, i) = abs(TF3_k);
    
    phase_data(1, i) = angle(TF1_k);
    phase_data(2, i) = angle(TF2_k);
    phase_data(3, i) = angle(TF3_k);
end

% Create a simple plot for magnitude responses
figure;
subplot(2, 1, 1);
plot(k_values, magnitude_data(1, :), 'b', 'LineWidth', 2, 'DisplayName', 'TF1');
hold on;
plot(k_values, magnitude_data(2, :), 'g', 'LineWidth', 2, 'DisplayName', 'TF2');
plot(k_values, magnitude_data(3, :), 'r', 'LineWidth', 2, 'DisplayName', 'TF3');
xlabel('k');
ylabel('Magnitude');
title('Magnitude Response');
grid on;
legend;

% Create a simple plot for phase responses
subplot(2, 1, 2);
plot(k_values, rad2deg(phase_data(1, :)), 'b', 'LineWidth', 2, 'DisplayName', 'TF1');
hold on;
plot(k_values, rad2deg(phase_data(2, :)), 'g', 'LineWidth', 2, 'DisplayName', 'TF2');
plot(k_values, rad2deg(phase_data(3, :)), 'r', 'LineWidth', 2, 'DisplayName', 'TF3');
xlabel('k');
ylabel('Phase (degrees)');
title('Phase Response');
grid on;
legend;

% Adjust plot settings
set(gcf, 'Position', [100, 100, 800, 600]);
