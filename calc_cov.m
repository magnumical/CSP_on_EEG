function [COVa COVb]=calc_cov(class_a,class_b)
%Class A 
COVa=0;
t=0; 
for i=1:80 
    t=class_a{i}; 
    mn=mean(t')'; %Nchannel satr dArad
    for j=1:size(t,2) 
        t(:,j)=t(:,j)-mn 
    end
    COVa=COVa+(t*t')/trace(t*t');
end
COVa=COVa/80; %taghsim bar tedad tA miyangin  har class bedast ayad
%  class B 
COVb=0;
t=0;
for i=1:80 
    t=class_b{i}; 
    mn=mean(t')'; 
    for j=1:size(t,2) 
        t(:,j)=t(:,j)-mn; 
    end
    COVb=COVb+(t*t')/trace(t*t');
end
COVb=COVb/80;
