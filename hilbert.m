close all

clear all

pkg load signal
pkg load data-smoothing

% limit frequencies for the butterworth bandpass filter f1 and f2

f1=2;

f2=9.99;

% reading amplitude and time
fid = fopen('fort.12', 'r');
timec = textscan(fid, '%f %*f');
fid = fclose(fid);

fid = fopen('fort.12', 'r');
ampc = textscan(fid, '%*f %f');
fid = fclose(fid);

% cells to number
time=cell2mat(timec);
amp=cell2mat(ampc);

% building the filter
DELTA=time(2)-time(1);
fs=1/DELTA;
fn=fs/2;
W(1,1)=f1/fn; W(1,2)=f2/fn;
[a,b]=butter(2,W);

% apply the filter
ampf=filtfilt(a,b,amp);
y=log10(abs(hilbert(ampf)));
%ys=smooth(y);
b=cat(2,time,y);
save('envelope.dat', 'b','-ascii','-tabs')

%b=cat(2,time,amp);
%save('output2.dat', 'b','-ascii','-double')


