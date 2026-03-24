clear all; close all; format long;
% Keeping momentum factors commented for now
n = ;  % Fill in with the number of states of our Markov Chain
% initial_momentum = ; % Fill in with our choice for appropriate initial momentum
P = zeros(n,n);
states = zeros(1,1);
% momentum_sequence = ones(1,1)*initial_momentum;
team0_score = 0;
team1_score = 0;
phi = (); % Define the initial 50/50 jump ball prob distribution
% First Half Code
t = 0;
% momentum = initial_momentum;
state = find(rand <= cumsum(phi),1); % Find first state 
while t < 1200 % Change to 1170 for end-of-half dynamics considerations
    % P = update_P(P,momentum);
    p = P(state,:);
    state = find(rand <= cumsum(p), 1); % Find next state in our sequence
    states = [states state]; % Can't think of any way to do this other than dynamically allocating
    [team0_score,team1_score] = update_score(state, team0_score, team1_score);
    % momentum = update_momentum(momentum, state);
    % momentum_sequence = [momentum_sequence momentum];
    t_temp = evolve_time(state);
    t = t+t_temp;
end
% state = end_half(P,...);  IF WE WANT TO CONSIDER END-OF-HALF/LATE GAME HAPPENINGS

% Second Half Code
t = 0;
% momentum = initial_momentum;
state = find(rand <= cumsum(phi),1); % Find first state 
while t < 1200 % Change to 1170 for end-of-half dynamics considerations
    % P = update_P(P,momentum);
    p = P(state,:);
    state = find(rand <= cumsum(p), 1); % Find next state in our sequence
    states = [states state]; % Can't think of any way to do this other than dynamically allocating
    [team0_score,team1_score] = update_score(state, team0_score, team1_score);
    % momentum = update_momentum(momentum, state);
    % momentum_sequence = [momentum_sequence momentum];
    t_temp = evolve_time(state);
    t = t+t_temp;
end
% state = end_half(P,...);  IF WE WANT TO CONSIDER END-OF-HALF/LATE GAME HAPPENINGS