function [class_a class_b]=classi(fdata,trial,y)
% 250 hz | 4s baraye har imagination
%  1000 sample/1 imagination
ia=1;ib=1
for i=1:160 % 160 andaze trial
    n=trial(i) + 999 %tul har nemune giri
    
    if y(i)==1 %left hand
        class_a{ia} =fdata(trial(i):n,:)';ia=ia+1;
    elseif y(i)==2%right hand
        class_b{ib}=fdata(trial(i):n,:)';ib=ib+1; 

end
end