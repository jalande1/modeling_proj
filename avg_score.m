clear all; close all;
sum = 0;
max = 0;
scores = [];
for i = 1:100
    i
    score = mock_tourney_func();
    if score > max
        max = score
    end
    sum = sum + score;
    scores = [scores score];
end
max
sum / 100
scores



sum = 0;
max = 0;
scores2 = [];
for i = 1:100
    score = mock_tourney_nomo_func();
    if score > max
        max = score
    end
    sum = sum + score;
    scores2 = [scores2 score];
end
max
sum / 100
scores2

tiledlayout(1, 2); 

% First histogram
nexttile;
histogram(scores, 10);
title('Momentum');

% Second histogram
nexttile;
histogram(scores2, 10);
title('No Momentum');