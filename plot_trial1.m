function y=plot_trial1(rawdata,trial)
figure()
for i=1:5
    %250Hz : 4sc :::> 1000 sample
    subplot(5,1,i)
    plot(rawdata(trial(i):1000+trial(i),:))
    
end



