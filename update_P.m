function [updated_P] = update_P(P,momentum,streak_counter)
    updated_P = P;
    update_list_0 = [1,3,5,6,10,11,13,15,20];
    update_list_1 = [12,14,16,17,21,22,2,4,9];
    if abs(streak_counter) >= 5
        if streak_counter > 0
            for i=1:numel(update_list_0)
                index = update_list_0(i);
                sum = sum_team_0(P(index,:));
                ordinary_loss_prob = 1-sum;
                new_win_prob = 1-ordinary_loss_prob*(1-momentum);
                updated_P(index,:) = redistribute_team0_win(P(index,:),new_win_prob);
            end
            
        else
            for i=1:numel(update_list_1)
                index = update_list_1(i);
                sum = sum_team_0(P(index,:));
                ordinary_loss_prob = 1-sum;
                new_win_prob = 1-ordinary_loss_prob*(1-momentum);
                updated_P(index,:) = redistribute_team1_win(P(index,:),new_win_prob);
            end
        end
    end
end