function [team0ft, team1ft, total_poss] = get_ftandpace(filename)
    mat = readmatrix(filename);
    [team0ft,team1ft] = mat(9,:);
    [team0pace,team1pace] = mat(10,:)
    total_poss = floor((team0pace+team1pace)/2);
end