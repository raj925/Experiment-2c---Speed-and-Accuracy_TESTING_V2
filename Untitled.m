numManip = sum([trials(:).cogLoadManip]);

for i = 1:trials(end).trialNumber
    if trials(i).cogLoadManip == 1
        trialNumber = trials(i).trialNumber;
       data(i).trialNumber = trialNumber;
    end
end

manipTrialNums = [data(:).trialNumber].';

clear i 

for i = 1:(numManip-1)
    cognitiveLoadTable(i).trialNumber = manipTrialNums(i);
end
