function [updated_P] = update_P(P,momentum,streak_counter)
    updated_P = P;
    update_list = [1,2,3,4,7,9,10,11,12,13,14,15,18,20,21,22];
    if abs(streak_counter) >= 5
        if streak_counter > 0
            for i=1:numel(update_list)
                index = update_list(i);
                sum = sum_team_0(P(index,:));
                ordinary_loss_prob = 1-sum;
                new_win_prob = 1-ordinary_loss_prob*(1-momentum);
                updated_P(index,:) = redistribute_team0_win(P(index,:),new_win_prob);
            end
            
        else
            for i=1:numel(update_list)
                index = update_list(i);
                sum = sum_team_0(P(index,:));
                ordinary_loss_prob = 1-sum;
                new_win_prob = 1-ordinary_loss_prob*(1-momentum);
                updated_P(index,:) = redistribute_team1_win(P(index,:),new_win_prob);
            end
        end
    end
end