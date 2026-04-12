clear all; close all;
sum = 0;
max = 0;
n = 100
scores = [];
s16_percentages_mo = zeros(1, 16);
f4_perc_mo = zeros(1, 4);
for i = 1:n
    i
    [score, s16, f4] = mock_tourney_func();
    if score > max
        max = score
    end
    sum = sum + score;
    s16_percentages_mo = s16_percentages_mo + s16
    f4_perc_mo = f4_perc_mo + f4
    scores = [scores score];
end
max
mean = sum / n
s16_percentages_mo = s16_percentages_mo / n;
f4_perc_mo = f4_perc_mo / n;

team_names = {
    'Michigan','Michigan St','Duke','Houston','Texas','Illinois','Nebraska','Arkansas', ...
    'Iowa St','Alabama','Arizona','Tennessee','Alabama','Purdue','Iowa','UConn'
};

final_fo = {
    'Michigan','UConn','Illinois','Arizona'
};

sum = 0;
max = 0;
s16_percentages_nomo = zeros(1, 16);
f4_perc_nomo = zeros(1, 4);
scores2 = [];
for i = 1:n
    [score, s16, f4] = mock_tourney_nomo_func();
    if score > max
        max = score
    end
    sum = sum + score;
    s16_percentages_nomo = s16_percentages_nomo + s16
    f4_perc_nomo = f4_perc_nomo + f4
    scores2 = [scores2 score];
end
max
mean = sum / n
s16_percentages_nomo = s16_percentages_nomo / n;
f4_perc_nomo = f4_perc_nomo / n;
scores2

figure;
tiledlayout(1, 2);
ax1 = nexttile;

bar(ax1, s16_percentages_mo)
title(ax1, 'Momentum');
xticks(ax1, 1:16);
xticklabels(ax1, team_names)
xtickangle(ax1, 90)
ylabel(ax1, 'Percentage (%)')

ax2 = nexttile;
bar(ax2, s16_percentages_nomo)
title(ax2, 'No Momentum');
xticks(ax2, 1:16);
xticklabels(ax2, team_names)
xtickangle(ax2, 90)
ylabel(ax2, 'Percentage (%)')

figure;
tiledlayout(1, 2);
ax1 = nexttile;

bar(ax1, f4_perc_mo)
title(ax1, 'Momentum');
xticks(ax1, 1:4);
xticklabels(ax1, final_fo)
xtickangle(ax1, 90)
ylabel(ax1, 'Percentage (%)')

ax2 = nexttile;
bar(ax2, f4_perc_nomo)
title(ax2, 'No Momentum');
xticks(ax2, 1:4);
xticklabels(ax2, final_fo)
xtickangle(ax2, 90)
ylabel(ax2, 'Percentage (%)')

figure;
tiledlayout(1, 2); 

% First histogram
nexttile;
histogram(scores, 10);
title('Momentum');
xlabel("Bracket Score")
ylabel("Count")

% Second histogram
nexttile;
histogram(scores2, 10);
title('No Momentum');
xlabel("Bracket Score")
ylabel("Count")