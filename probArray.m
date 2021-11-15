
function [outputArg1] = probArray(trainSet, testSet,Klasa,Attribiute, A, Vector)

% This function calculating the propabilty of for each variable
% It takes as arguments:
% M_trainingSet - array to train on
%   Klasa - for specifying for what class to calculate for - need to
%   automate this
%   V as a which collum in training set we are operrating for
%An array of classes , this is the last collumn with unique numbers
Collum_Class = trainSet(:,width(trainSet));
Collum_Class = unique(Collum_Class);
%disp("KURW CO TO JEST")
%Now it will filterthe rows that correspond to a certain class
macierzKlasy = zeros(height(trainSet),width(trainSet));
for i = 1:height(trainSet)
    if trainSet(i,width(trainSet)) == Collum_Class(Klasa)
        
        macierzKlasy(i,:) = trainSet(i,:);
    end
end
%deleting class diffrent than the class specified in argument of ProbArray
macierzKlasy(all(macierzKlasy==0,2),:)=[];
%   getting unique values for each var that correspond to certain class


%   peparing an array with enough places to fill it with propabilities for
%   values
propabilityArrayFinal = zeros(height(unique(trainSet(:,Attribiute))),1);

%   calculating how many of certain values for specified class exist
[VFreq, value] = groupcounts(macierzKlasy(:,Attribiute));

allUniqueValuesInColumn = unique(trainSet(:,Attribiute));
freqAll = [];
for i = 1:height(allUniqueValuesInColumn)
    encountered = false;
    for j = 1:height(value)
        if allUniqueValuesInColumn(i) == value(j)
            freqAll = [freqAll; VFreq(j)];
            encountered = true;
            break
        end
    end
    if encountered == false
        freqAll = [freqAll ; [0]];
    end
end
%    calculating freqency
propabilityArrayFinal = (freqAll+A)/((height(macierzKlasy)+A*Vector(1,Attribiute)));
outputArg1 = propabilityArrayFinal;
end