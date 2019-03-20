%% DRAW PLOTS

% Load the data that were used in the class (Spring 2019)
datdir = '/Users/clinpsywoo/Dropbox/2011-yr/teaching/Stats_2019Spring/activities';
load(fullfile(datdir, 'A03_data.mat'));

figure;
k = 0;
for i = 1:numel(x)
    k = k + 1;
    subplot(numel(x),2,k);
    histogram(x{i},1:10)
    xlabel('data');
    ylabel('counts')
    set(gca, 'xtick', 0:10);
    k = k + 1;
    subplot(numel(x),2,k);
    N = 20; 
    scatter(norminv((((1:N)-0.5)/N)', 0, 1), sort(x{i}))
    xlabel('normal scores');
    ylabel('data')
end

