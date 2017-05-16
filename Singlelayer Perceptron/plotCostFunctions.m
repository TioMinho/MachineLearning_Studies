clear all

x = linspace(0,1);
y1 = -log(x);
y2 = -log(1-x);

plt = Plot(x, y1, x, y2);

plt.XLabel = 'Y^{previsto} = h(\theta^{T}X)';
plt.YLabel = 'Custo';
plt.Title = 'Custo de Classificação';
plt.Legend = {'-log(\theta^{T}X)', '-log(1 - \theta^{T}X)'};

plt.LineWidth = [3, 3];
plt.LineStyle = {'-', '-'};
plt.export('errorClass.png');