function [updated_row] = redistribute_team1_win(oldrow,new_win_prob)
    temp_0_row = (1-new_win_prob)/sum_team_0(oldrow)*team_0mask(oldrow);
    temp_1_row = new_win_prob/sum_team_1(oldrow)*team_1mask(oldrow);
    updated_row = temp_0_row+temp_1_row;
end