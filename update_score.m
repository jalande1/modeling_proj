function [updated_0score, updated_1score,flag] = update_score(state, team0_score,team1_score,team0ft,team1ft)
    flag = 1;
    if state == 1
        updated_0score = team0_score+2;
        updated_1score = team1_score;
    elseif state == 3
        updated_0score = team0_score + 3;
        updated_1score = team1_score;
    elseif any([state == 5, state == 6, state == 7])
        ft = rand(1);
        if ft < team0ft
            update = 1;
        else
            update = 0;
        end
        updated_0score = team0_score + update;
        updated_1score = team1_score;
    elseif state == 12
        updated_0score = team0_score;
        updated_1score = team1_score+2;
    elseif state == 14
        updated_0score = team0_score;
        updated_1score = team1_score+3;
    elseif any([state == 16, state == 17, state == 18])
        ft = rand(1);
        if ft < team1ft
            update = 1;
        else
            update = 0;
        end
        updated_0score = team0_score;
        updated_1score = team1_score + update;
    else
        updated_0score=team0_score;
        updated_1score=team1_score;
        flag = 0;
    end
end