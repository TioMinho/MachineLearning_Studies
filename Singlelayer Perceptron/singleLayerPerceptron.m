clear all
addpath('lib')
load notasT.mat
% notas = randi([0 10], 50, 2);
% 
% result = zeros(50, 1); for i = 1:50
%     if((notas(i,1)+notas(i,2))/2 > 5)
%         result(i) = 1;
%     else
%         result(i) = 0;
%     end
% end
%  
% data = [notas result];

% ------ Treinamento do Perceptron -----------------
X = [ones(length(data), 1) data(:,1:2)]';
y = data(:, 3)';
theta = zeros(3,1);

alpha = 1;
iterations = 50;
error_Hist = zeros(iterations,1);

for i = 1:iterations
    permute = randperm(length(X));
    X = X(:, permute);
    y = y(:, permute);
    
    for j = 1:length(X)
       theta = theta - alpha * (sigmoid(theta' * X(:,j)) - y(j)) * X(:,j); 
    end
    error_Hist(i) = sum(sigmoid(theta' * X) - y);
end
% ----------------------------------------------------

% --------------------------- Plotagem
[decision_X, decision_Y] = decisionBound(theta, X);
 
pos = find(data(:,3) == 1);
neg = find(data(:,3) == 0);

plt = Plot(data(pos,1), data(pos,2), data(neg,1), data(neg,2));
 
%plt.XLabel = 'Nota da 1� Prova';
%plt.YLabel = 'Nota da 2� Prova';
%plt.Title = 'Avalia��o da Turma Lorem Ipsum';
%
%plt.LineWidth = [2,2,2];
%plt.LineStyle = {'o', 'x', '-'};
%
%plt = Plot(error_Hist);
%plt.XLabel = 'N� da Itera��o';
%plt.YLabel = 'Erro Total';
%plt.Title = 'Hist�rico de Erros';
%
%plt.export('erros.png');