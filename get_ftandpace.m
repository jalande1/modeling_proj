function [team0ft, team1ft, total_poss] = get_ftandpace(filename)
    mat = readmatrix(filename);
    team0ft = mat(9,1);
    team1ft = mat(9,2);
    team0pace = mat(10,1);
    team1pace = mat(10,2);
    total_poss = floor((team0pace+team1pace)/2);
end