function [output] = team_1mask(input)
    output = zeros(1,22);
    for i =1:22
        if any([i==12,i==14,i==16,i==17,i==21,i==22,i==2,i==4,i==9])
            output(i) = input(i);
        end
    end
end