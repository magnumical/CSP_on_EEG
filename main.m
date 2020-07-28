%% main
load('F:\DATAASET\BCI_IV_2b\B01T.mat')
rawdata=data{1,3}.X;
trial=data{1,3}.trial;
y=data{1,3}.y;

%% raw plot
plot_trial1(rawdata,trial)
%% filtered plot
filplot_trial1(rawdata,trial)
%% filtering 
fdata=fild(rawdata);
%% defining classes a:left , b:right
[class_a class_b]=classi(fdata,trial,y);


 %%     Covariance
 [COVa COVb]=calc_cov(class_a,class_b);
 %% CSP
W=mycsp(COVa,COVb);
%%  training features 
[train_a train_b]=trmaker(class_a,class_b,W);
%%
[ta_test tb_test]=testmaker(W);

%%  classifiCation 
%classificc(training_set,test_set)
training=(horzcat(train_a,train_b))'; 
test=(horzcat(ta_test,tb_test))'; 
group=''; 
group(1:60)='1'; group(61:160)='2';
group=group'; 

cls_test_LDA=classify(test,training,group,'diaglinear')





%%      Arduino to control prosthetic hand
%          a=arduino('COM4','UNO')
        writeDigitalPin(a, 'D8', 0);i=0
        writeDigitalPin(a, 'D7', 0);  
for i=1:120 % 120 andaze trial
    if cls_test_LDA(i)=='A' %left hand
        writeDigitalPin(a, 'D7', 1);
           pause(1);writeDigitalPin(a, 'D7', 0);
        
    elseif cls_test_LDA(i)=='B'%right hand
        writeDigitalPin(a, 'D8', 1);
           pause(1);writeDigitalPin(a, 'D8', 0);

end
end
