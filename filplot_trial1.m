function y=filplot_trial1(rawdata,trial)

[n,m]=size(rawdata);



figure()
for i=1:5
    %250Hz : 4sc :::> 1000 sample
    t=(1:n)*4; 
sampling_frequency = 250;Fpass = 8;Fstop = 14
Dpass = 0.057501127785;                 
Dstop = 0.0001;                         
density  = 20; 
[n, fo, ao, w] = firpmord([Fpass, Fstop]/125, [1 0], [Dpass, Dstop]); 
b1 = firpm(n, fo, ao, w, {density});
Hd1 = dfilt.dffir(b1);  

data=rawdata(trial(i):1000+trial(i),:)
x1=filter(Hd1,data)
    
    
    
    subplot(5,1,i)
    plot(x1(:,:))
    
end



