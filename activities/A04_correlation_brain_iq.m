%% Load data

load('iq_brain1_10.mat')
load('iq_brain11_20.mat')

%% merge two datasets
iq_brain_merged(1:10,1) = iq_brain1_10(:,1);
iq_brain_merged(11:20,1) = iq_brain11_20(:,1);

iq_brain_merged(1:10,2) = iq_brain1_10(:,2);
iq_brain_merged(11:20,2) = iq_brain11_20(:,2);

%% correlation
corr_all = corr(iq_brain_merged(:,2), iq_brain_merged(:,1));
corr_A = corr(iq_brain1_10(:,2), iq_brain1_10(:,1));
corr_B = corr(iq_brain11_20(:,2), iq_brain11_20(:,1));

%%
subplot(2,2,1)
a = scatter(iq_brain_merged(:,2), iq_brain_merged(:,1), 'filled');
title('20명의 데이터')
xlabel('뇌의 크기(pixel, *10,000)')
xlim([70, 120])
ylabel('IQ')
l = lsline;
l.LineWidth = 1;
l.Color = [1 0 0];

subplot(2,2,2)
scatter(iq_brain1_10(:,2), iq_brain1_10(:,1), 'r', 'filled');
hold on;
scatter(iq_brain11_20(:,2), iq_brain11_20(:,1), 'b', 'filled');
legend('데이터A', '데이터 B', 'Location', 'southeast');
title('20명의 데이터')
xlabel('뇌의 크기(pixel, *10,000)')
xlim([70, 120])
ylabel('IQ')

subplot(2,2,3)
scatter(iq_brain1_10(:,2), iq_brain1_10(:,1), 'filled');
title('데이터 A')
xlabel('뇌의 크기(pixel, *10,000)')
xlim([70, 120])
ylabel('IQ')

subplot(2,2,4)
scatter(iq_brain11_20(:,2), iq_brain11_20(:,1), 'filled');
title('데이터 B')
xlabel('뇌의 크기(pixel, *10,000)')
xlim([70, 120])
ylabel('IQ')

%%
close all 
boxplot(mat, 'Labels', {'Team A'; 'Team B'}) ;
 hold on
 plot([0.5 1.4], [corr_A corr_A], '--', 'Linewidth', 2);
 hold on
 plot([1.6 2.5], [corr_B corr_B], '--', 'Linewidth', 2);
 
 %%
 %scatter([head_A; head_B], [PE_A; PE_B])
 scatter(head_A, abs(PE_A))
 hold on
 scatter(head_B, abs(PE_B))
 %[head_A; head_B], [PE_A; PE_B])
 corr([head_A; head_B], [abs(PE_A); abs(PE_B)])