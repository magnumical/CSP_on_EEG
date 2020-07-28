function  [svmclassify performance_svm] =classificc(training_set,test_set)
training_set=(horzcat(train_a,train_b))'; 
test_set=(horzcat(a_test,b_test))'; 

group=''; 
group(1:60)='A';%A=1 
group(61:120)='B'; %B=2
group=group'; 



 SVMStruct= svmtrain(training_set,group)
 svmclassify(SVMStruct,test_set)
 performance_svm=100*(length(find(svmclassify(1:60)=='A'))+length(find(svmclassify((611):n_tot)=='B')))/n_tot 

