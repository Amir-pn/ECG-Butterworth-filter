
% MATLAB PROGRAM ecg_hfn.m

clear all               % clears all active variables
close all
clc

ecg = load('ecg_hfn.dat');
fs = 1000; %sampling rate = 1000 Hz

slen = length(ecg);
t=[1:slen]/fs;

figure(1);
plot(t, ecg);
title('Noisy signal');
axis tight;
xlabel('Time in seconds');
ylabel('ECG');

% implementing butterworth filter
%A
[b,a]= butter(2,0.02,'low');
n1=filter(b,a,ecg);
figure(2);
subplot(4,1,1);
plot(t, n1,'Linewidth', 1.5);
title('filter output A');
axis([ 0 5 , -3 3]);
% B
[b,a]= butter(8,0.04,'low');
n2=filter(b,a,ecg);
subplot(4,1,2);
plot(t, n2,'Linewidth', 1.5);
title('filter output B');
axis([ 0 5 , -3 3]);
%C
[b,a]= butter(8,0.08,'low');
n3=filter(b,a,ecg);
subplot(4,1,3);
plot(t, n3,'Linewidth', 1.5);
title('filter output C');
axis([ 0 5 , -3 3]);
%D
[b,a]= butter(8,0.14,'low');
n4=filter(b,a,ecg);
subplot(4,1,4);
plot(t, n4,'Linewidth', 1.5);
axis([ 0 5 , -3 3]);
title('filter output D');
figure(3);
freqz(b,a);
fvtool(b,a);

%Synchronized Averaging


