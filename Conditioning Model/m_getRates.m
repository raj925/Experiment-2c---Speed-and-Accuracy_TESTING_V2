function rates = m_getRates(path, learningRate)

load(path, 'trials');

rates = zeros(420, 2);
trust1 = 0;
trust2 = 0;
rates(1, 1) = (trust1 - trust2 + 2) / 4;

for i = 151:270
    trial = trials(i);
    
    if trial.whichAdvisor == 1
        valence = trial.algorithm1Correct * 2 - 1;
        trust1 = trust1 + learningRate * (valence - trust1);
    else
        valence = trial.algorithm2Correct * 2 - 1;
        trust2 = trust2 + learningRate * (valence - trust2);
    end
    
    if trial.forcedAdvisor == 1
        rates(i, 2) = NaN;
    else
        rates(i, 2) = 2 - trial.whichAdvisor;
    end
    
    rates(i + 1, 1) = (trust1 - trust2 + 2) / 4;
end

rates(i + 1, 1) = NaN;

end
