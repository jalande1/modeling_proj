function [output] = team_0mask(input)
    output = zeros(1,22);
    for i =1:22
        if any([i==1,i==3,i==5,i==6,i==10,i==11,i==13,i==15,i==20])
            output(i) = input(i);
        end
    end
end