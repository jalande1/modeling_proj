function [alpha] = get_alpha(state)
    check = mod(state,11);
    if any([check==6,check==10,check==0])
        alpha = 1;
    elseif any([check==1,check==9])
        alpha = 2;
    elseif check==3
        alpha = 3;
    else
        alpha = 0;
    end
end