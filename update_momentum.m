function [new_momentum] = update_momentum(momentum,state,streak_counter)
    if abs(streak_counter) < 5
        new_momentum = 0;
    end
    if abs(streak_counter) == 5
        new_momentum = 0.1;
    end
    if abs(streak_counter) > 5
        alpha = get_alpha(state);
        new_momentum = alpha*momentum*(1-momentum);
    end
end