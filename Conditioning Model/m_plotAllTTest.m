function m_plotAllTTest(lowers, highers)

figure;
categories = {'Low Predicted Rate', 'High Predicted Rate'};
categories = categorical(categories, categories);

for i = 1:length(lowers)
    plot(categories, [lowers(i), highers(i)]);
    hold on;
end

ylabel('Actual Rate');

end
