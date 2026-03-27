function [P] = make_P(filename)
% For now, just to get a sense of the structure of the matrix:
[Amake2, Amiss2, Amake3, Amiss3, A3ft, A2ft, A1and1, Aturn, Aoreb, Adreb, Amakeft, Aand1] = get_stats(); % Still need to define entirety of get_stats function, including arguments (how to unpack from file)
[Bmake2, Bmiss2, Bmake3, Bmiss3, B3ft, B2ft, B1and1, Bturn, Boreb, Bdreb, Bmakeft, Band1] = get_stats(); % Still need to define entirety of get_stats function, including arguments (how to unpack from file)
P = zeros(22,22);
P(1,:) = [zeros(1,6) Aand1 zeros(1,4) Bmake2 Bmiss2 Bmake3 Bmiss3 B3ft B2ft 0 B1and1 Bturn 0 0];
P(2,:) = [zeros(1,9) Aoreb zeros(1,11) Bdreb];
P(3,:) = [zeros(1,6) Aand1 zeros(1,4) Bmake2 Bmiss2 Bmake3 Bmiss3 B3ft B2ft 0 B1and1 Bturn 0 0];
P(4,:) = [zeros(1,9) Aoreb zeros(1,11) Bdreb];
P(5,:) = [zeros(1,5) 1 zeros(1,16)];
P(6,:) = [zeros(1,6) 1 zeros(1,15)];
P(7,:) = [zeros(1,11) Amakeft*[Bmake2 Bmiss2 Bmake3 Bmiss3 B3ft B2ft 0 B1and1 Bturn 0 0]] + [zeros(1,9) (1-Amakeft)*[Aoreb zeros(1,11) Bdreb]];
P(8,:) = [zeros(1,11) Amakeft*[Bmake2 Bmiss2 Bmake3 Bmiss3 B3ft B2ft 0 B1and1 Bturn 0 0]] + [zeros(1,9) (1-Amakeft)*[Aoreb zeros(1,11) Bdreb]];
P(9,:) = [zeros(1,11) Bmake2 Bmiss2 Bmake3 Bmiss3 B3ft B2ft 0 B1and1 Bturn 0 0];
P(10,:) = [Amake2 Amiss2 Amake3 Amiss3 A3ft A2ft 0 A1and1 Aturn 0 zeros(1,12)];
P(11,:) = [Amake2 Amiss2 Amake3 Amiss3 A3ft A2ft 0 A1and1 Aturn 0 zeros(1,12)];

P(12,:) = [Amake2 Amiss2 Amake3 Amiss3 A3ft A2ft 0 A1and1 Aturn 0 0 zeros(1,6) Band1 zeros(1,4)];
P(13,:) = [zeros(1,10) Adreb zeros(1,9) Boreb 0];
P(14,:) = [Amake2 Amiss2 Amake3 Amiss3 A3ft A2ft 0 A1and1 Aturn 0 0 zeros(1,6) Band1 zeros(1,4)];
P(15,:) = [zeros(1,10) Adreb zeros(1,9) Boreb 0];
P(16,:) = [zeros(1,16) 1 zeros(1,5)];
P(17,:) = [zeros(1,17) 1 zeros(1,4)];
P(18,:) = [Bmakeft*[Amake2 Amiss2 Amake3 Amiss3 A3ft A2ft 0 A1and1 Aturn 0 0 zeros(1,11)]] + [zeros(1,10) (1-Bmakeft)*[Adreb zeros(1,9) Boreb] 0];
P(19,:) = [Bmakeft*[Amake2 Amiss2 Amake3 Amiss3 A3ft A2ft 0 A1and1 Aturn 0 0 zeros(1,11)]] + [zeros(1,10) (1-Bmakeft)*[Adreb zeros(1,9) Boreb] 0];
P(20,:) = [Amake2 Amiss2 Amake3 Amiss3 A3ft A2ft 0 A1and1 Aturn 0 0 zeros(1,11)];
P(21,:) = [zeros(1,11) Bmake2 Bmiss2 Bmake3 Bmiss3 B3ft B2ft 0 B1and1 Bturn 0 0];
P(22,:) = [zeros(1,11) Bmake2 Bmiss2 Bmake3 Bmiss3 B3ft B2ft 0 B1and1 Bturn 0 0];
end