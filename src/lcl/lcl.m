% LCL PWM Filter

clear all; % clear all code
close all; % close all windows
clc; % command line clear

% Load the control package for transfer functions [tf]
pkg load control

% Define filter parameters
Li = 200e-06; % Inverter side inductor 200uH example
Cf_wye = 180e-06; % Filter capacitor in wye arrangement 180uF example
Lg = 100e-06; % Grid side inductor 100uH example

% Setup a transfer function in the `s` domain [laplace]
s = tf('s');

% Transfer function for impedance [Zf]
% Doc: An Improved LCL Filter Design in Order to Ensure Stability without
% Damping and Despite Large Grid Impedance Variations, MDPI 2017
% Authors: Romdhane, Naouar, Belkhodja, Monmasson
% DOI: 10.3390/en10030336
Zf = ((Li * Lg * Cf_wye) * (s^3)) + ((Li + Lg) * s);

% Bode plot of the impedance response
[bode_mag, bode_pha, bode_w] = bode(Zf);

bode_hz = bode_w / (2 * pi); % Convert from rps to hz
bode_mag_db = 20 * (log10(bode_mag)); % Convert from ratio to dB

% Manual bode plots with Hz [not Rad/s]
figure
subplot(2,1,1); % Subplot 1 of (2,1)
semilogx(bode_hz, bode_mag_db); % Plot the magnitude
zoom on;
grid on;
title('Bode - Zf');
ylabel('Magnitude[dB]');

subplot(2,1,2); % Subplot 2 of (2,1)
semilogx(bode_hz, bode_pha); % Plot the phase
grid on;
zoom on;
ylabel('Phase[deg]');
xlabel('Frequency[Hz]');

