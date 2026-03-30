function [t_temp] = evolve_time(state,stateminus1)
    check = mod(state,11);
    if check <= 5
        t_temp = 1;
    elseif all([check == 6, stateminus1 ~= 5])
        t_temp = 1;
    elseif check == 9
        t_temp = 1;
    else
        t_temp = 0;
    end
end