clear all; close all;
sum = 0;
max = 0;
scores = [];
for i = 1:100
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
histogram(scores, 10)