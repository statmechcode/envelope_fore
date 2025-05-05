close all

clear all

pkg load signal
pkg load data-smoothing


% seleziono frequenze limite per il filtro passa-banda butterworth f1 ed f2

f1=2;

f2=9.99;

% leggo ampiezza e tempo
fid = fopen('fort.12', 'r');
timec = textscan(fid, '%f %*f');
fid = fclose(fid);

fid = fopen('fort.12', 'r');
ampc = textscan(fid, '%*f %f');
fid = fclose(fid);

% passo da celle a numero
time=cell2mat(timec);
amp=cell2mat(ampc);

% costruisco il filtro
DELTA=time(2)-time(1);
fs=1/DELTA;
fn=fs/2;
W(1,1)=f1/fn; W(1,2)=f2/fn;
[a,b]=butter(2,W);

% applico il filtro
ampf=filtfilt(a,b,amp);
y=log10(abs(hilbert(ampf)));
%ys=smooth(y);
b=cat(2,time,y);
save('envelope.dat', 'b','-ascii','-tabs')

%b=cat(2,time,amp);
%save('output2.dat', 'b','-ascii','-double')


