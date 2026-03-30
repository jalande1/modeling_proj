function [updated_0score, updated_1score] = update_score(state, team0_score,team1_score,team0ft,team1ft)
    if state == 1
        updated_0score = team0_score+2;
        updated_1score = team1_score;
    elseif state == 3
        updated_0score = team0_score + 3;
        updated_1score = team1_score;
    elseif any([state == 5, state == 6, state == 7])
        ft = floor(team0ft/rand(1));
        updated_0score = team0_score + ft;
        updated_1score = team1_score;
    elseif state == 12
        updated_0score = team0_score;
        updated_1score = team1_score+2;
    elseif state == 14
        updated_0score = team0_score;
        updated_1score = team1_score+3;
    elseif any([state == 16, state == 17, state == 18])
        ft = floor(team1ft/rand(1));
        updated_0score = team0_score;
        updated_1score = team1_score + ft;
    else
        updated_0score=team0_score;
        updated_1score=team1_score;
    end
end