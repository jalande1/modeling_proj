clear all; close all; format long;
matchups = {['Duke','vs','Siena'],['Ohio St','vs','TCU'],['St Johns','vs','N Iowa'],['Kansas','vs','Cal Baptist'],['Louisville','vs','S Florida'],['Michigan St','vs','N Dakota St'],['UCLA','vs','UCF'],['UConn','vs','Furman'],['Florida','vs','Prairie View'],['Clemson','vs','Iowa'],['Vanderbilt','vs','McNeese'],['Nebraska','vs','Troy'],['North Carolina','vs','VCU'],['Illinois','vs','Penn'],['Saint Marys','vs','Texas A&M'],['Houston','vs','Idaho'],['Arizona','vs','LIU'],['Villanova','vs','Utah St'],['Wisconsin','vs','High Point'],['Arkansas','vs','Hawaii'],['BYU','vs','Texas'],['Gonzaga','vs','Kennesaw St'],['Miami','vs','Missouri'],['Purdue','vs','Queens'],['Michigan','vs','Howard'],['Georgia','vs','Saint Louis'],['Texas Tech','vs','Akron'],['Alabama','vs','Hofstra'],['Tennessee','vs','Miami OH'],['Virginia','vs','Wright St'],['Kentucky','vs','Santa Clara'],['Iowa St','vs','Tennessee St']};
for i=1:32
teams = split(matchups{i}, 'vs');
team0 = teams(1);
team1 = teams(2);
team0wins_momentum = 0;
team0wins_nomomentum = 0;
numruns = 1000;
% Simulate with momentum
for j=1:numruns
[team0ft, team1ft, total_halfposs] = get_ftandpace(team0,team1);
base_P = make_P(team0,team1);
P=base_P;
initial_momentum = 0;
momentum_sequence = ones(1,1)*initial_momentum;
active_counter = 0;
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
while team0_score == team1_score
% Overtime protocol
state = find(rand <= cumsum(phi),1); % Find first state 
states = [states state];
t = 0;
while t < total_halfposs/4
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
end
if team0_score > team1_score
    team0wins_momentum = team0wins_momentum + 1;
elseif team0_score == team1_score
    ties = ties+1;
    ties
end
end

% Simulate without momentum
for j = 1:numruns
[team0ft, team1ft, total_halfposs] = get_ftandpace(team0,team1);
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
if team0_score > team1_score
    team0wins_nomomentum = team0wins_nomomentum + 1;
elseif team0_score == team1_score
    ties = ties+1;
    ties
end
end

disp([team0,' wins ',num2str(team0wins_nomomentum/numruns*100),'% of the time with no momentum.'])
disp([team0,' wins ',num2str(team0wins_momentum/numruns*100),'% of the time with momentum.'])
end

