function [outputArg1] = cellsWithPropabilities(trainSet, testSet, A, Vector)
% this matrix has values form training set corresponding to test set
% 
% disp("This is a converted trainSet")
% matrixIndexed = convertData(trainSet, trainSet)
% disp("This is a converted testSet")
matrixIndexed = convertData(trainSet, testSet)

% DATA SET TO HOLD THE TABLES OF PROPABILITIES
finalProbCells = {};
if width(trainSet) > width(testSet) 
    valueIfNoTarget = width(trainSet) - width(testSet) 
    
else
    valueIfNoTarget = 1
end

%
numberOfAttribiutesTestSet = width(trainSet) - valueIfNoTarget
trainSetLastColumn = width(trainSet);
%       CALCULATING ARRAYS OF PROPABILITIES FOR EACH CLASS
for k = 1:height(unique(trainSet(:,end)))
    probailitiesArray = [];
    for j = 1:height(testSet)
        calcArray = [];
        %Since the known vector of values is always 1 less than width of
        %trainset
        for i = 1:(numberOfAttribiutesTestSet)
            %fprintf('This is %i column\n', i);
            helpArray = probArray(trainSet,testSet,k,i,A,Vector);
            calcArray = [calcArray, helpArray(matrixIndexed(j,i))];
        end
    probailitiesArray = [probailitiesArray; calcArray];
    end
    finalProbCells{end+1} = probailitiesArray;
end
outputArg1 = finalProbCells;
end

