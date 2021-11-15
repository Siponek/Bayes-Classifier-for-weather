function [oArg1, oArg2] = calcFinal(finalTrainingProbs,trainSet,testSet)
%CALCFINAL Summary of this function goes here
%   Detailed explanation goes here
classesColumn=trainSet(:,end);
[frequencyOfClasses, uselessValue, probOfClass ]= groupcounts(classesColumn);
valuesOfClassesColumn = unique(classesColumn);
for i =1:height(valuesOfClassesColumn)
    fprintf("This is class %i and its likelihood\n",i)
    propabilityOfClasses(i) = frequencyOfClasses(i)/height(classesColumn);
    propabilityOfClasses(:,i)
end
%multiplying propabilities of ATTRIBIUTES
finalArray = [];
for i = 1:length(finalTrainingProbs)
    fprintf("This is likelihood table for testSet without classes for class %i\n",i)
    multiArray = finalTrainingProbs{i}
    targetArray = [];
    for j = 1:height(testSet)
        targetArray = [targetArray; prod(multiArray(j,:))];
    end
    finalArray = [finalArray targetArray];
end
%multiplying propabilities of ATTRIBIUTES WITH PROPABILITIES OF CLASSES
for n = 1:width(propabilityOfClasses)
    for m = 1:height(finalArray)
        if n>width(finalArray)
            finalArray = [finalArray zeros(height(finalArray),1)];
            break
        finalArray(m,n)= finalArray(m,n)*propabilityOfClasses(n);
        end
    end
end
disp("This is final likelihood table for each class (as column)")
finalArray
oArg2 = finalArray;
testSetFinalArray = [];
for i = 1:height(finalArray)
    %in case that finalArray does not has more than 1 class prob
    if width(finalArray) < 2
        testSetFinalArray = [testSetFinalArray ; 11]

    elseif finalArray(i,1) > finalArray(i,2)
        testSetFinalArray = [testSetFinalArray ; 11];
    elseif finalArray(i,1) < finalArray(i,2)
        testSetFinalArray = [testSetFinalArray ; 12];
    else
        testSetFinalArray = [testSetFinalArray ; -1];
    end
end

oArg1 = testSetFinalArray;

end

