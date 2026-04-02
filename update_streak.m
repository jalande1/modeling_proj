function [streak_count_updated] = update_streak(streak_count,state,stateminus1)
    if streak_count > 0 % Indicating that Team 0 is on a run
        if any([state == 1,state==3,state==9,state==10,state==20])
            streak_count_updated = streak_count + 1;
        elseif all([state == 7, stateminus1 == 6])
            streak_count_updated = streak_count + 1;
        elseif any([state==12,state==14,state==20,state==21,state==9,state==17])
            streak_count_updated = 0;
        else
            streak_count_updated=streak_count;
        end
    end
    if streak_count < 0 % Indicating Team 1 is on a run
        if any([state == 1,state==3,state==9,state==10,state==20,state==6])
            streak_count_updated = 0;
        elseif all([state == 18, stateminus1 == 17])
            streak_count_updated = streak_count + 1;
        elseif any([state==12,state==14,state==20,state==21,state==9])
            streak_count_updated = streak_count-1;
        else
            streak_count_updated=streak_count;
        end
    end
    if streak_count == 0 % Indicating there is an opportunity to start a run
        if any([state == 1,state==3,state==9,state==10,state==20,state==6])
            streak_count_updated = 1;
        elseif all([state == 18, stateminus1 == 17])
            streak_count_updated = 1;
        elseif any([state==12,state==14,state==20,state==21,state==9])
            streak_count_updated = -1;
        else
            streak_count_updated=streak_count;
        end
    end
end