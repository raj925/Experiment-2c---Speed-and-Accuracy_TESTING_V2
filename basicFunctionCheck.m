% Check basic overall function of programming
for s = 1:11
    if s <=2 || s>3

        algorithm2Correct = [trials(1:510).algorithm2Correct].';
        algorithm1Correct = [trials(1:510).algorithm1Correct].';
        trialType = [trials(1:510).trialType].';
        whichAdvisor = [trials(1:510).whichAdvisor].';
       
        for i = 151:360
            if whichAdvisor(i) == 1 && trialType(i) == 2
                temp(i).algor1ForcedCor = algorithm1Correct(i);
            elseif whichAdvisor(i) == 2 && trialType(i) == 2
                temp(i).algor2ForcedCor = algorithm2Correct(i);
            end
        end
        for i = 1:length(temp)
            if isempty(temp(i).algor1ForcedCor)
                temp(i) = [];
            end
        end
        data(s).trialTimingMaxLoad = trialTimingMaxLoad;
    end
end

data(3)= [];


%% Notes:

if whichAdvisor == 1 && trialType == 2; a = 1; end