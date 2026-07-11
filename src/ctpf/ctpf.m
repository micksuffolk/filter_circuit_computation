% C-Type Damped Harmonic Filter 'CTPF'

clear all; % clear all code
close all; % close all windows
clc; % command line clear

% Load the control package for transfer functions [tf]
pkg load control

% Define filter parameters
C1 = 43e-06; % Main C, 43uF example for 150Hz Fres
C2 = 345e-06; % Part of the LC network, 345uF example for 150Hz Fres
L = 29e-03; % Part of the LC network, 29mH example for 150Hz Fres
R = 200; % Damping resistor, 200 Ohm example for 150Hz Fres

% Setup a transfer function in the `s` domain [laplace]
s = tf('s');

% Transfer function for impedance [Zf]
% Doc: Novel Design Methodology for C-type Harmonic Filter Banks, IEEE 2012
% Authors: Randy Horton, Roger Dugan, Daryl Hallmark
% DOI: 10.1109/TDC.2012.6281629
Zf = ( (R * (s^3)) + ((s^2) / C1) + (((R / (L * C2)) + ...
     (R / (L * C1))) * s) + (1 / (L * C2 * C1)) ) / ...
     ( ((s^2) + ((R / L) * s) + (1 / (L * C2)) ) * s );

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

% Manually calculating the filter impedance at some frequency of interest.
% Note, to calculate Zf (Ohms) from the bode plot: Zf = 10^(dB/20) or ...
% Note, to calculate dB from the Cf calculation = 20*Log(Zf)
f = 150; % What frequency do we want to calculate the filter impedance?
% L & C2 in series, in parallel with R, all of this group in series with C1
Zf = abs(((1/(2*pi*f*C1))*(-i)) + ...
     (1 / ((1 / (((1/(2*pi*f*C2))*(-i)) + ((2*pi*f*L)*(i)))) + (1/R))));
