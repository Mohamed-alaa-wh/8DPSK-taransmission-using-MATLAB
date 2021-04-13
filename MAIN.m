clc;
clear;

bit=1e6;
s = randi([0 1],bit,1);
Zn=dpskmod(s,8);
BER=[];
snr=[];
i=1;
snr(1)=0 ;

while i<16
     Rn=awgn(Zn,snr(i));
     New_Zn=dpskdemod(Rn,8);
     [no BER_1] = biterr(s,New_Zn);
     BER=[BER BER_1];
     snr(i+1)=snr(i)+1
     i=i+1
end
new_snr_vector = snr
new_snr_vector(16)=[]

semilogy(new_snr_vector,BER)
title(' BER VS SNR ');
ylabel('BER');
xlabel('SNR');
