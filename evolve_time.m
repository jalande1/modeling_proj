function [t_temp] = evolve_time(state,stateminus1)
    if mod(state,11) <= 5
        t_temp = 1;
    elseif mod(state,11) == 6 && stateminus1 ~= 5
        t_temp = 1;
    elseif mod(state,11) == 9
        t_temp = 1;
    else
        t_temp = 0;
    end
end