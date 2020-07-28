function [train_a train_b]=trmaker(class_a,class_b,W)
%class A 
train_a=[];train_b=[]; 
  
for i=1:80 
    s=0;afterfilter=[];temp=0; temp=class_a{i}; 
    afterfilter=W*temp; %2m*t
    
    s2=0; afterfilterb=[];temp2=0;temp2=class_b{i}; 
    afterfilterb=W*temp2;
    
    %filtering 
    for j=1:size(afterfilter,1) 
        train_a(j,i)=var(afterfilter(j,:)); 
        %s=s+var(afterfilter(j,:)); 
    end
        train_a(:,i)=log((train_a(:,i)));%feature of training set of class b
    
    
    for j=1:size(afterfilterb,1) 
        train_b(j,i)=var(afterfilterb(j,:)); 
        %s2=s2+var(afterfilterb(j,:));  %majmu variance
    end
        train_b(:,i)=log((train_b(:,i))); 

end



