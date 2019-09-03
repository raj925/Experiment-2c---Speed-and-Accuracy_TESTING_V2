% x is the array of values to plot a bar chart for
% eg x = [data5.meanCj1 data.meanCj2]
function f = errorBarPlot(x)
nparticipants = 31;
figureX = [];
figureStd = [];
for i = 1:size(x,1)
    figureX = [figureX, mean(x(i,:))];
end
for i = 1:size(x,1)
    figureStd = [figureStd, std(x(i,:))];
end
bar(figureX);
hold on;
errorbar(figureX,figureStd/sqrt(nparticipants));
f = figureStd;
end