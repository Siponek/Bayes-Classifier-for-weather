function [outputArg2] = convertData(trainingSet, testSet)
%CONVERTDATA Summary of this function goes here
%   Detailed explanation goes here
%This function converts data from set to indexed data depering on unique
%values in traning set
mSecondIndex = [];
%If the test set has lest ATTRIBIUTES than trainingSet then decrese number
%of loops
if width(trainingSet) > width(testSet) 
    valueIfNoTarget = width(trainingSet) - width(testSet) 
else
    valueIfNoTarget = 0
end
% for each row of trainSet
for k = 1:height(testSet)
    mFirstIndex = [];
    %for each column of attribiutes of training set (without target)
    for j = 1:(width(trainingSet)-valueIfNoTarget)
        %for unique values in each column in trainSet
        for i = 1:height(unique(trainingSet(:,j)))
            %matrix of unique values of each attr of train set
            helpMatrix = unique(trainingSet(:,j));

            if testSet(k,j) == helpMatrix(i)
                mFirstIndex = [mFirstIndex, i];
            end
        end
    end
    mSecondIndex = [mSecondIndex;mFirstIndex];
end
outputArg2 = mSecondIndex;
end

