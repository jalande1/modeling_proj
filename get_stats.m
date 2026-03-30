function [Amake2, Amiss2, Amake3, Amiss3, A3ft, A2ft, A1and1, Aturn, Aoreb, Adreb, Amakeft, Aand1, ...
    Bmake2, Bmiss2, Bmake3, Bmiss3, B3ft, B2ft, B1and1, Bturn, Boreb, Bdreb, Bmakeft, Band1] = get_stats(filename)
    mat = readmatrix(filename);
    Atov = mat(1,1);
    Btov = mat(1,2);
    A_is_fouled = mat(2,1);
    B_is_fouled = mat(2,2);
    A2ptr = mat(3,1);
    B2ptr = mat(3,2);
    A2ptp = mat(4,1);
    B2ptp = mat(4,2);
    A3ptr = mat(5,1);
    B3ptr = mat(5,2); 
    A3ptp = mat(6,1);
    B3ptp = mat(6,2);
    Adrebp = mat(7,1);
    Bdrebp = mat(7,2);
    Aorebp = mat(8,1);
    Borebp = mat(8,2);
    Amakeft = mat(9,1);
    Bmakeft = mat(9,2);

    Aturn = Atov; 
    A1and1 = 0;
    A2ft = (1-Atov)*A_is_fouled*A2ptr*(1-A2ptp);
    A3ft = (1-Atov)*A_is_fouled*A3ptr*(1-A3ptp);
    Amiss3 = (1-Atov)*(1-A_is_fouled)*A3ptr*(1-A3ptp);
    Amake3 = (1-Atov)*A3ptr*A3ptp;
    Amiss2 = (1-Atov)*(1-A_is_fouled)*A2ptr*(1-A2ptp);
    Amake2 = (1-Atov)*A2ptr*A2ptp;
    Band1 = B_is_fouled;

    Bturn = Btov; 
    B1and1 = 0;
    B2ft = (1-Btov)*B_is_fouled*B2ptr*(1-B2ptp);
    B3ft = (1-Btov)*B_is_fouled*B3ptr*(1-B3ptp);
    Bmiss3 = (1-Btov)*(1-B_is_fouled)*B3ptr*(1-B3ptp);
    Bmake3 = (1-Btov)*B3ptr*B3ptp;
    Bmiss2 = (1-Btov)*(1-B_is_fouled)*B2ptr*(1-B2ptp);
    Bmake2 = (1-Btov)*B2ptr*B2ptp;
    Aand1 = A_is_fouled;


    % Tweak
    Aoreb = Aorebp / (Aorebp + Bdrebp);
    Boreb = Borebp / (Borebp + Adrebp);
    Adreb = Adrebp / (Adrebp + Borebp);
    Bdreb = Bdrebp / (Bdrebp + Aorebp);



end