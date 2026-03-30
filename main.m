clear all; close all; format long;
% Keeping momentum factors commented for now
n = 22;  % Fill in with the number of states of our Markov Chain
% initial_momentum = ; % Fill in with our choice for appropriate initial momentum
filename = 'test1.csv'; % Path to file containing the statistics for our teams
[team0ft, team1ft, total_halfposs] = get_ftandpace(filename);
P = make_P(filename);
states = [];
% momentum_sequence = ones(1,1)*initial_momentum;
team0_score = 0;
team1_score = 0;
phi = [0.5 zeros(1,10) 0.5 zeros(1,10)]; % Define the initial 50/50 jump ball prob distribution
% First Half Code
t = 0;

% momentum = initial_momentum;
state = find(rand <= cumsum(phi),1); % Find first state 
while t < total_halfposs % Change to 1170 for end-of-half dynamics considerations
    % P = update_P(P,momentum);
    p = P(state,:);
    state = find(rand <= cumsum(p), 1); % Find next state in our sequence
    states = [states state]; % Can't think of any way to do this other than dynamically allocating
    [team0_score,team1_score,flag] = update_score(state, team0_score, team1_score,team0ft,team1ft);
    % momentum = update_momentum(momentum, state);
    % momentum_sequence = [momentum_sequence momentum];
    if t >= 1
        t_temp = evolve_time(state,states(numel(states)-1));
    else
        t_temp = 1;
    end
    t = t+t_temp;
end
% state = end_half(P,...);  IF WE WANT TO CONSIDER END-OF-HALF/LATE GAME HAPPENINGS

% Second Half Code
t = 0;
% momentum = initial_momentum;
count2=0;
state = find(rand <= cumsum(phi),1); % Find first state 
while t < total_halfposs % Change to 1170 for end-of-half dynamics considerations
    % P = update_P(P,momentum);
    p = P(state,:);
    state = find(rand <= cumsum(p), 1); % Find next state in our sequence
    states = [states state]; % Can't think of any way to do this other than dynamically allocating
    [team0_score,team1_score,flag] = update_score(state, team0_score, team1_score,team0ft,team1ft);
    % momentum = update_momentum(momentum, state);
    % momentum_sequence = [momentum_sequence momentum];
    if t >= 1
        t_temp = evolve_time(state,states(numel(states)-1));
    else
        t_temp = 1;
    end
    t = t+t_temp;
    
end
disp('Final Score:')
disp('Team A      Team B')
disp([num2str(team0_score),'            ',num2str(team1_score)]);
% state = end_half(P,...);  IF WE WANT TO CONSIDER END-OF-HALF/LATE GAME HAPPENINGS