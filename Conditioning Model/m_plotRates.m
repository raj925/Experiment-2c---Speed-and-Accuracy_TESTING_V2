function m_plotRates(rates)

ranges = 0.35:0.02:0.65;
means = zeros(length(ranges) - 1, 1);

for i = 1:(length(ranges) - 1)
    inds = rates(:, 1) > ranges(i) & rates(:, 1) < ranges(i + 1);
    means(i) = nanmean(rates(inds, 2));
end

figure;
plot(ranges(1:15) + 0.01, means);
xlim([0 1]);
ylim([0 1]);
xlabel('Predicted Rate');
ylabel('Actual Rate');

end
