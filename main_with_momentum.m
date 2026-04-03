clear all; close all; format long;
n = 22;  % Fill in with the number of states of our Markov Chain
initial_momentum = 0;
numruns = 1000;
team0scores = zeros(1,numruns);
team1scores = zeros(1,numruns);
team0wins = 0;
active_counter = 0;
for i = 1:numruns
filename = 'test_duke.csv'; % Path to file containing the statistics for our teams
[team0ft, team1ft, total_halfposs] = get_ftandpace(filename);
base_P = make_P(filename);
P=base_P;
momentum_sequence = ones(1,1)*initial_momentum;
team0_score = 0;
team1_score = 0;
phi = [0.5 zeros(1,10) 0.5 zeros(1,10)]; % Define the initial 50/50 jump ball prob distribution
% First Half Code
t = 0;
momentum = initial_momentum;
streak_counter = 0;
state = find(rand <= cumsum(phi),1); % Find first state 
states = [state];
while t < total_halfposs % Change to 1170 for end-of-half dynamics considerations
    P = update_P(P,momentum,streak_counter);
    p = P(state,:);
    state = find(rand <= cumsum(p), 1); % Find next state in our sequence
    states = [states state]; % Can't think of any way to do this other than dynamically allocating
    [team0_score,team1_score,flag] = update_score(state, team0_score, team1_score,team0ft,team1ft);
    if t>=1
        streak_counter = update_streak(streak_counter,state,states(end-1));
    end
    momentum = update_momentum(momentum, state, streak_counter);
    if momentum ~= 0
        active_counter = active_counter + 1;
    end
    % momentum_sequence = [momentum_sequence momentum];
    if t >= 1
        t_temp = evolve_time(state,states(numel(states)-1));
    else
        t_temp = 1;
    end
    t = t+t_temp;
    P = base_P;
end
% state = end_half(P,...);  IF WE WANT TO CONSIDER END-OF-HALF/LATE GAME HAPPENINGS

% Second Half Code
t = 0;
% momentum = initial_momentum;
count2=0;
% breakflag = 0;
% t_temps = [];
state = find(rand <= cumsum(phi),1); % Find first state 
states = [states state];
while t < total_halfposs % Change to 1170 for end-of-half dynamics considerations
    P = update_P(P,momentum,streak_counter);
    p = P(state,:);
    state = find(rand <= cumsum(p), 1); % Find next state in our sequence
    states = [states state]; % Can't think of any way to do this other than dynamically allocating
    [team0_score,team1_score,flag] = update_score(state, team0_score, team1_score,team0ft,team1ft);
    if t >= 1
        streak_counter = update_streak(streak_counter,state,states(end-1));
    end
    momentum = update_momentum(momentum, state, streak_counter);
    % momentum_sequence = [momentum_sequence momentum];
    if t >= 1
        t_temp = evolve_time(state,states(numel(states)-1));
        % t_temps = [t_temps t_temp];
        % if numel(t_temps) > 20
        %     if t_temps(numel(t_temps)-20:end) == zeros(1,21)
        %             breakflag = 1;
        %             states
        %         break
        %     end
        % end
    else
        t_temp = 1;
    end
    t = t+t_temp;
    P = base_P;
end
% disp('Final Score:')
% disp('Team A      Team B')
% disp([num2str(team0_score),'            ',num2str(team1_score)]);
team0scores(i) = team0_score;
team1scores(i) = team1_score;
if team0_score > team1_score
    team0wins = team0wins + 1;
end
% if breakflag == 1
%     break
% end
end
% state = end_half(P,...);  IF WE WANT TO CONSIDER END-OF-HALF/LATE GAME HAPPENINGS
team0winpercent = 100*team0wins/numruns
avgteam0score = mean(team0scores)
avgteam1score = mean(team1scores)
avg_active = active_counter/numruns