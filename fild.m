function [fdata]=fild(rawdata)
%%  mu+beta+gamma band butterworth
 [b,a]=butter(6,[ 8/125,( 14)/125],'bandpass'); %125=250/2
 fdata=filter(b,a,rawdata);
