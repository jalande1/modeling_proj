function [Amake2, Amiss2, Amake3, Amiss3, A3ft, A2ft, A1and1, Aturn, Aoreb, Adreb, Amakeft, Aand1, ...
    Bmake2, Bmiss2, Bmake3, Bmiss3, B3ft, B2ft, B1and1, Bturn, Boreb, Bdreb, Bmakeft, Band1] = get_stats(filename)
    Atov = 
    A3ptr = 
    A2ptr = 
    A3ptp = 
    A2ptp =
    A_is_fouled = 

    Aturn = ___ * B_is_fouled 
    A1and1 = 0;
    A2ft = (1-Atov)*A_is_fouled*A2ptr*(1-A2ptp) * (1-B_is_fouled) ;
    A3ft = (1-Atov)*A_is_fouled*A3ptr*(1-A3ptp) * (1-B_is_fouled) ;
    Amiss3 = (1-Atov)*(1-A_is_fouled)*A3ptr*(1-A3ptp) * (1-B_is_fouled) ;
    Amake3 = (1-Atov)*A3ptr*A3ptp * (1-B_is_fouled) ;
    Amiss2 = (1-Atov)*(1-A_is_fouled)*A2ptr*(1-A2ptp) * (1-B_is_fouled) ;
    Amake2 = (1-Atov)*A2ptr*A2ptp * (1-B_is_fouled) ;
    Band1 = B_is_fouled;

    Bturn = ___ * B_is_fouled 
    B1and1 = 0;
    B2ft = (1-Btov)*B_is_fouled*B2ptr*(1-B2ptp) * (1-A_is_fouled) ;
    B3ft = (1-Btov)*B_is_fouled*B3ptr*(1-B3ptp) * (1-A_is_fouled) ;
    Bmiss3 = (1-Btov)*(1-B_is_fouled)*B3ptr*(1-B3ptp) * (1-A_is_fouled) ;
    Bmake3 = (1-Btov)*B3ptr*B3ptp * (1-A_is_fouled) ;
    Bmiss2 = (1-Btov)*(1-B_is_fouled)*B2ptr*(1-B2ptp) * (1-A_is_fouled) ;
    Bmake2 = (1-Btov)*B2ptr*B2ptp * (1-A_is_fouled) ;
    Aand1 = A_is_fouled;


    % Tweak
    Aorebp = 
    Adrebp = 
    Borebp = 
    Bdrebp = 

    Aoreb = Aorebp / (Aorebp + BdrebP);
    Boreb = Borebp / (Borebp + AdrebP);
    Adreb = Adrebp / (Adrebp + Borebp);
    Bdreb = Bdrebp / (Bdrebp + Aorebp);

    Amakeft = 
    Bmakeft = 



end