function [ta_test tb_test]=testmaker(W)
%% load 
load('F:\DATAASET\BCI_IV_2b\B01E.mat')
rawdata=data{1,1}.X;
trial=data{1,1}.trial
y=data{1,1}.y
%%  mu+beta+gamma band butterworth
[b,a]=butter(6,[ 8/125,( 30)/125],'bandpass'); %125=250/2
%fdata=filter(b,a,rawdata);
fdata=rawdata
%%  
% 250 hz | 4s baraye har imagination
% so 1000 sample per imagination
ia=1;ib=1
for i=1:160 % 160 andaze trial
    n=trial(i) + 999 %tul har nemune giri
    if y(i)==1 %left hand
        a_test{ia} =fdata(trial(i):n,:)';
        ia=ia+1;
    elseif y(i)==2%right hand
        b_test{ib}=fdata(trial(i):n,:)';
        ib=ib+1; 

end
end

%%  Test features 
  ta_test=[]
     tb_test=[]
for i=1:80 
    s=0;afterfilter=[];temp=0; temp=a_test{i}; 
    afterfilter=W*temp; %2m*t
    
     
    s2=0; afterfilterb=[];temp2=0;temp2=b_test{i}; 
    afterfilterb=W*temp2;
    
    %filtering 
    for j=1:size(afterfilter,1) 
        ta_test(j,i)=var(afterfilter(j,:)); 
        s=s+var(afterfilter(j,:)); 
    end
        ta_test(:,i)=log((ta_test(:,i))/s);%feature of training set of class b
    
    
    for j=1:size(afterfilterb,1) 
        tb_test(j,i)=var(afterfilterb(j,:)); 
        s2=s2+var(afterfilterb(j,:));  %majmu variance
    end
        tb_test(:,i)=log((tb_test(:,i))/s2); 

end
