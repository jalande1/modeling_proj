function [P] = make_P(team0,team1)
% For now, just to get a sense of the structure of the matrix:
[Amake2, Amiss2, Amake3, Amiss3, A3ft, A2ft, A1and1, Aturn, Aoreb, Adreb, Amakeft, Agetfoul, Aortg, Adrtg, Aoppdrtg, ...
    Bmake2, Bmiss2, Bmake3, Bmiss3, B3ft, B2ft, B1and1, Bturn, Boreb, Bdreb, Bmakeft, Bgetfoul, Bortg, Bdrtg, Boppdrtg] = get_stats(team0,team1); % Still need to define entirety of get_stats function, including arguments (how to unpack from file)
P = zeros(22,22);
P(1,:) = (1-Agetfoul)* [zeros(1,6) 0 zeros(1,4) Bmake2 Bmiss2 Bmake3 Bmiss3 B3ft B2ft 0 B1and1 Bturn 0 0] + [zeros(1,6) Agetfoul zeros(1,15)];
P(2,:) = Agetfoul*[zeros(1,5) 1 zeros(1,16)] + (1-Agetfoul)*[zeros(1,9) Aoreb zeros(1,11) Bdreb];
P(3,:) = (1-Agetfoul)*[zeros(1,6) 0 zeros(1,4) Bmake2 Bmiss2 Bmake3 Bmiss3 B3ft B2ft 0 B1and1 Bturn 0 0] + [zeros(1,6) Agetfoul zeros(1,15)];
P(4,:) = Agetfoul*[zeros(1,4) 1 zeros(1,17)]+(1-Agetfoul)*[zeros(1,9) Aoreb zeros(1,11) Bdreb];
P(5,:) = [zeros(1,5) 1 zeros(1,16)];
P(6,:) = [zeros(1,6) 1 zeros(1,15)];
P(7,:) = Amakeft*[zeros(1,11) Bmake2 Bmiss2 Bmake3 Bmiss3 B3ft B2ft 0 B1and1 Bturn 0 0] + (1-Amakeft)*[zeros(1,9) Aoreb zeros(1,11) Bdreb];
P(8,:) = Amakeft*[zeros(1,11) Bmake2 Bmiss2 Bmake3 Bmiss3 B3ft B2ft 0 B1and1 Bturn 0 0] + (1-Amakeft)*[zeros(1,9) Aoreb zeros(1,11) Bdreb];
P(9,:) = [zeros(1,11) Bmake2 Bmiss2 Bmake3 Bmiss3 B3ft B2ft 0 B1and1 Bturn 0 0];
P(10,:) = [Amake2 Amiss2 Amake3 Amiss3 A3ft A2ft 0 A1and1 Aturn 0 zeros(1,12)];
P(11,:) = [Amake2 Amiss2 Amake3 Amiss3 A3ft A2ft 0 A1and1 Aturn 0 zeros(1,12)];

P(12,:) = (1-Bgetfoul)*[Amake2 Amiss2 Amake3 Amiss3 A3ft A2ft 0 A1and1 Aturn 0 0 zeros(1,6) 0 zeros(1,4)] + [zeros(1,6) Bgetfoul zeros(1,15)];
P(13,:) = Bgetfoul*[zeros(1,16) 1 zeros(1,5)]+(1-Bgetfoul)*[zeros(1,10) Adreb zeros(1,9) Boreb 0];
P(14,:) = (1-Bgetfoul)*[Amake2 Amiss2 Amake3 Amiss3 A3ft A2ft 0 A1and1 Aturn 0 0 zeros(1,6) 0 zeros(1,4)] + [zeros(1,6) Bgetfoul zeros(1,15)];
P(15,:) = Bgetfoul*[zeros(1,15) 1 zeros(1,6)] + (1-Bgetfoul)*[zeros(1,10) Adreb zeros(1,9) Boreb 0];
P(16,:) = [zeros(1,16) 1 zeros(1,5)];
P(17,:) = [zeros(1,17) 1 zeros(1,4)];
P(18,:) = Bmakeft*[Amake2 Amiss2 Amake3 Amiss3 A3ft A2ft 0 A1and1 Aturn 0 0 zeros(1,11)] + (1-Bmakeft)*[zeros(1,10) Adreb zeros(1,9) Boreb 0];
P(19,:) = Bmakeft*[Amake2 Amiss2 Amake3 Amiss3 A3ft A2ft 0 A1and1 Aturn 0 0 zeros(1,11)] + (1-Bmakeft)*[zeros(1,10) Adreb zeros(1,9) Boreb 0];
P(20,:) = [Amake2 Amiss2 Amake3 Amiss3 A3ft A2ft 0 A1and1 Aturn 0 0 zeros(1,11)];
P(21,:) = [zeros(1,11) Bmake2 Bmiss2 Bmake3 Bmiss3 B3ft B2ft 0 B1and1 Bturn 0 0];
P(22,:) = [zeros(1,11) Bmake2 Bmiss2 Bmake3 Bmiss3 B3ft B2ft 0 B1and1 Bturn 0 0];

% update_list = [1,2,3,4,7,9,10,11,12,13,14,15,18,20,21,22];
update_list_0offense = [10,11,12,14,18,20];
update_list_1offense = [1,3,7,9,21,22];

for i=1:numel(update_list_0offense)
    index = update_list_0offense(i);
    gamma = (Aortg-Bdrtg)/(Aortg-Aoppdrtg);
    gamma
    sum = sum_team_0(P(index,:));
    if gamma <= 1
        new_win_prob = gamma*sum;
    else
        new_win_prob = 1-(1-sum)/gamma;
    end
    P(index,:) = redistribute_team0_win(P(index,:),new_win_prob);
end

for i=1:numel(update_list_1offense)
    index = update_list_1offense(i);
    sum = sum_team_1(P(index,:));
    gamma = (Bortg-Adrtg)/(Bortg-Boppdrtg);
    gamma
    if gamma <= 1
        new_win_prob = gamma*sum;
    else
        new_win_prob = 1-(1-sum)/gamma;
    end
    P(index,:) = redistribute_team1_win(P(index,:),new_win_prob);
end
end