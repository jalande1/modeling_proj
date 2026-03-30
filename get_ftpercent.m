function [team0ft, team1ft] =(filename)
    mat = readmatrix(filename);
    [team0ft,team1ft] = mat(9,:);
end