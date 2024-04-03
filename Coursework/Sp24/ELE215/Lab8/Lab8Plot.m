clc; clear; close all;

C1 = 1e-8;
C2 = 2.2e-8;

R1 = 10000;
R2 = 54000;
R3 = 100;


cF = (1/(2*pi)) * sqrt((R1+R3)/(R1*R2*R3*C1*C2));

gain = -((R2*C2)/(R1*(C1+C2)));

bandwidth = (1/(2*pi))*((C1+C2)/(R2*C1*C2));

f = logspace(1,5,1000);
omega = 2*pi*f;

num = ((1 ./ (R1*C1))*1j*f);
den = (1j*f).^2 + (1j*f).*((C1 + C2)/(R2*C1*C2)) + ((R1 + R3)/(R1*R2*R3*C1*C2));

H = -(num ./ den);

figure;
subplot(2,1,1);
semilogx(f, 20*log10(abs(H)));
grid on;
title('Magnitude Response');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');

subplot(2,1,2);
semilogx(f, (angle(H)*180) / pi);
grid on;
title('Phase Response');
xlabel('Frequency (Hz)');
ylabel('Phase (Degrees)');

