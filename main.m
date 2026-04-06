clear all; close all; format long;
% Keeping momentum factors commented for now
n = 22;  % Fill in with the number of states of our Markov Chain
% initial_momentum = ; % Fill in with our choice for appropriate initial momentum
team0 = 'Duke';
team1 = 'Georgia';
numruns = 1000;
team0scores = zeros(1,numruns);
team1scores = zeros(1,numruns);
team0wins = 0;
[team0ft, team1ft, total_halfposs] = get_ftandpace(team0,team1);
team0_vs_time = zeros(1,2*total_halfposs);
team1_vs_time = zeros(1,2*total_halfposs);
for i = 1:numruns
P = make_P(team0,team1);
% momentum_sequence = ones(1,1)*initial_momentum;
team0_score = 0;
team1_score = 0;
phi = [0.5 zeros(1,10) 0.5 zeros(1,10)]; % Define the initial 50/50 jump ball prob distribution
% First Half Code
t = 0;
% momentum = initial_momentum;
state = find(rand <= cumsum(phi),1); % Find first state 
states = [state];
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
    if i == 1
        team0_vs_time(t) = team0_score;
        team1_vs_time(t) = team1_score;
    end
end
% state = end_half(P,...);  IF WE WANT TO CONSIDER END-OF-HALF/LATE GAME HAPPENINGS

% Second Half Code
t = 0;
% momentum = initial_momentum;
count2=0;
state = find(rand <= cumsum(phi),1); % Find first state 
states = [states state];
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
    if i == 1
        team0_vs_time(t+total_halfposs) = team0_score;
        team1_vs_time(t+total_halfposs) = team1_score;
    end
end
while team0_score == team1_score
% Overtime protocol
state = find(rand <= cumsum(phi),1); % Find first state 
states = [states state];
t = 0;
while t < total_halfposs/4
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
    if i == 1
        team0_vs_time(t+total_halfposs) = team0_score;
        team1_vs_time(t+total_halfposs) = team1_score;
    end
end
end
% disp('Final Score:')
% disp('Team A      Team B')
% disp([num2str(team0_score),'            ',num2str(team1_score)]);
team0scores(i) = team0_score;
team1scores(i) = team1_score;
if team0_score > team1_score
    team0wins = team0wins + 1;
end
end
% state = end_half(P,...);  IF WE WANT TO CONSIDER END-OF-HALF/LATE GAME HAPPENINGS
team0winpercent = 100*team0wins/numruns
avgteam0score = mean(team0scores)
avgteam1score = mean(team1scores)

% figure(1); plot([1:total_halfposs*2],team0_vs_time,'b-','linewidth',1.5); hold on;
% plot([1:total_halfposs*2],team1_vs_time,'r-','linewidth',1.5); xlabel('Possession #');
% ylabel('Points'); title('Game Flow for Illinois vs. Iowa'); legend('Illinois', 'Iowa');