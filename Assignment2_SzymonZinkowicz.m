allData = readtable('Data_sheet.txt');
allData = table2array(allData);
%Need to choose random rows for trainSet and testSet
randomRowsChoosing = randperm(height(allData));
randomRowsChoosing = transpose(randomRowsChoosing);

%This is for choosing the rows from allData set for trainSet and testSet
%randomRowsBoundUp = round((height(allData)/2));
%randomRowsBoundDown = round((height(allData)/2))+1;
randomRowsBoundUp = 10;
randomRowsBoundDown = 11;

%Random trainSet
trainSet = allData((randomRowsChoosing(1:randomRowsBoundUp)),:)
%Random testSet
%A test set without the target
%testSet = allData((randomRowsChoosing(randomRowsBoundDown:end)),1:(width(allData)-1))
%A test set with the target
testSet = allData((randomRowsChoosing(randomRowsBoundDown:end)),:)

% LAPLACE SMOOTHING
vectorOfNumberOfPossibleValues = [3 3 2 2];
A = 1;

%Check if values are not less than 1
IfNotLess1(trainSet,testSet)
attribiuteNumberDiff = width(trainSet) - width(testSet);
if attribiuteNumberDiff >= 0 && attribiuteNumberDiff <=1
    disp("The matrixcies are all good")
else
    disp("The matrixcies are (not) good")
end

%   cells with propability tables from testSet
finalTrainingProbs = cellsWithPropabilities(trainSet,testSet, A, vectorOfNumberOfPossibleValues);
for m = 1:(width(finalTrainingProbs))
    fprintf('This is %i class form trainingSet\n', m)
    disp(finalTrainingProbs{m})
end

%   final multiplaying of values (propabilities of attribiues and probs of
%   classes
[testSetFinalArray propabilitiesOfDecisions] = calcFinal(finalTrainingProbs,allData,testSet);

%final output
disp("-1 is when the propability is EQUAL")
finalAnswer = [testSet(:,(1:(width(testSet)-1))) , testSetFinalArray]

%Checking the error rate
if attribiuteNumberDiff == 0
    disp("Correspoding target. Left testSet target, right Bayes prediction")
    resultArrayCompare = [ testSet(:,end) finalAnswer(:,end)]

    errorRate = testSetFinalArray(:,end) ~= testSet(:,end);
    errorRate = sum(errorRate)/height(errorRate)
end

% A graph how to show how uncertain the bayes classifier is
b = bar(propabilitiesOfDecisions,'FaceColor',[0 .5 .5],'EdgeColor',[0 .9 .9],'LineWidth',1.5);
b(2).FaceColor = [.7 .7 .5];
xtips1 = b(1).XEndPoints;
ytips1 = b(1).YEndPoints;
labels1 = string(b(1).YData);
text(xtips1,ytips1,labels1,'HorizontalAlignment','center','VerticalAlignment','bottom')
xtips2 = b(2).XEndPoints;
ytips2 = b(2).YEndPoints;
labels2 = string(b(2).YData);
text(xtips2,ytips2,labels2,'HorizontalAlignment','left',...
    'VerticalAlignment','bottom')

%TO DO LIST:
%     Logarythimic propabilities

