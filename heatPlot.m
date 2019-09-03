function f = heatPlot(x,y,xSegments,ySegments)

    % Bin the data:
    % pts = linspace(scaleMin, scaleMax, segments);
    xMin = min(x);
    xMax = max(x);
    yMin = min(y);
    yMax = max(y);
    
    xPts = linspace(xMin, xMax, xSegments);
    yPts = linspace(yMin, yMax, ySegments);
    
    N = histcounts2(y(:), x(:), yPts, xPts);

    % Plot scattered data (for comparison):
    % subplot(1, 2, 1);
%     scatter(x, y, 'r.');
%     axis equal;
%     set(gca, 'XLim', [xMin xMax], 'YLim', [yMin, yMax]);

    % Plot heatmap:
    % subplot(1, 2, 2);
    imagesc(xPts, yPts, N);
    axis equal;
    set(gca, 'XLim', [xMin xMax], 'YLim', [yMin, yMax], 'YDir', 'normal');
    
    f = N;

end