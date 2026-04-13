function [Amake2, Amiss2, Amake3, Amiss3, A3ft, A2ft, A1and1, Aturn, Aoreb, Adreb, Amakeft, Aand1, Aortg, Adrtg, Aoppdrtg ...
    Bmake2, Bmiss2, Bmake3, Bmiss3, B3ft, B2ft, B1and1, Bturn, Boreb, Bdreb, Bmakeft, Band1, Bortg, Bdrtg, Boppdrtg] = get_stats(team0,team1)
    names = {'Abl Christian','Air Force','Akron','Alabama','Alabama A&M','Alabama St','Albany','Alcorn St','American','App State','AR-Pine Bluff','Arizona','Arizona St','Arkansas','Arkansas St','Army','Auburn','Austin Peay','Ball St','Baylor','Bellarmine','Belmont','Bethune','Binghamton','Boise St','Boston College','Boston U','Bowling Green','Bradley','Brown','Bryant','Bucknell','Buffalo','Butler','BYU','C Arkansas','C Connecticut','C Michigan','Cal Baptist','Cal Poly','California','Campbell','Canisius','Charleston','Charleston So','Charlotte','Chattanooga','Chicago St','Cincinnati','Clemson','Cleveland St','Coastal Car','Colgate','Colorado','Colorado St','Columbia','Coppin St','Cornell','Creighton','CS Bakersfield','CS Fullerton','CS Northridge','Dartmouth','Davidson','Dayton','Delaware','Delaware St','Denver','DePaul','Detroit Mercy','Drake','Drexel','Duke','Duquesne','E Carolina','E Illinois','E Kentucky','E Michigan','E Tennessee St','E Texas A&M','E Washington','Elon','Evansville','F Dickinson','Fairfield','FGCU','Florida','Florida A&M','Florida Atlantic','Florida Intl','Florida St','Fordham','Fresno St','Furman','G Washington','Gardner-Webb','George Mason','Georgetown','Georgia','Georgia So','Georgia St','Georgia Tech','Gonzaga','Grambling','Grand Canyon','Green Bay','Hampton','Harvard','Hawaii','High Point','Hofstra','Holy Cross','Hou Christian','Houston','Howard','Idaho','Idaho St','Illinois','Illinois Chicago','Illinois St','Incarnate Word','Indiana','Indiana St','Iona','Iowa','Iowa St','IU Indy','J Madison','Jackson St','Jacksonville','Jacksonville St','Kansas','Kansas City','Kansas St','Kennesaw St','Kent St','Kentucky','La Salle','Lafayette','Lamar','Le Moyne','Lehigh','Liberty','Lindenwood','Lipscomb','Little Rock','LIU','Long Beach St','Longwood','Louisiana','Louisiana Tech','Louisville','Loyola Chi','Loyola MD','Loyola Mymt','LSU','Maine','Manhattan','Marist','Marquette','Marshall','Maryland','Maryland ES','McNeese','Memphis','Mercer','Mercyhurst','Merrimack','Miami','Miami OH','Michigan','Michigan St','Middle Tenn','Milwaukee','Minnesota','Miss Valley St','Mississippi','Mississippi St','Missouri','Missouri St','Monmouth','Montana','Montana St','Morehead St','Morgan St','Mt St Marys','Murray St','N Alabama','N Arizona','N Colorado','N Dakota St','N Florida','N Illinois','N Iowa','N Kentucky','N Texas','Navy','NC A&T','NC Asheville','NC Central','NC Greensboro','NC State','NC Wilmington','Nebraska','Nevada','New Hampshire','New Haven','New Mexico','New Mexico St','New Orleans','Niagara','Nicholls','NJIT','Norfolk St','North Carolina','North Dakota','Northeastern','Northwestern','Notre Dame','NW State','Oakland','Ohio','Ohio St','Oklahoma','Oklahoma St','Old Dominion','Omaha','Oral Roberts','Oregon','Oregon St','Pacific','Penn','Penn St','Pepperdine','Pittsburgh','Portland','Portland St','Prairie View','Presbyterian','Princeton','Providence','Purdue','Purdue FW','Queens','Quinnipiac','Radford','Rhode Island','Rice','Richmond','Rider','Robert Morris','Rutgers','S Alabama','S Carolina St','S Dakota St','S Florida','S Illinois','S Indiana','S Utah','Sacramento St','Sacred Heart','Saint Josephs','Saint Louis','Saint Marys','Saint Peters','Sam Houston','Samford','San Diego','San Diego St','San Francisco','San Jose St','Santa Clara','SC Upstate','SE Louisiana','SE Missouri St','Seattle','Seton Hall','SF Austin','Siena','SIU Edward','SMU','South Carolina','South Dakota','Southern','Southern Miss','St Bonaventure','St Francis PA','St Johns','St Thomas','Stanford','Stetson','Stonehill','Stony Brook','Syracuse','Tarleton St','TCU','Temple','Tenn Tech','Tennessee','Tennessee St','Texas','Texas A&M','Texas A&M-CC','Texas So','Texas St','Texas Tech','The Citadel','Toledo','Towson','Troy','Tulane','Tulsa','UAB','UC Davis','UC Irvine','UC Riverside','UCF','UCLA','UConn','UCSB','UCSD','UL Monroe','UMass','UMass Lowell','UMBC','UNLV','USC','UT Arlington','UT Martin','UT Rio Grande','Utah','Utah St','Utah Tech','Utah Valley','UTEP','UTSA','Valparaiso','Vanderbilt','VCU','Vermont','Villanova','Virginia','Virginia Tech','VMI','W Carolina','W Georgia','W Illinois','W Kentucky','W Michigan','Wagner','Wake Forest','Washington','Washington St','Weber St','West Virginia','Wichita St','William & Mary','Winthrop','Wisconsin','Wofford','Wright St','Wyoming','Xavier','Yale','Youngstown St'};
    mat = readmatrix('unc_vcu.csv');
    mat = mat(:,2:end);
    index0 = find(strcmp(names,team0));
    index1 = find(strcmp(names,team1));
    Atov = mat(index0,1);
    Btov = mat(index1,1);
    A_is_fouled = mat(index0,2);
    B_is_fouled = mat(index1,2);
    A2ptr = mat(index0,3);
    B2ptr = mat(index1,3);
    A2ptp = mat(index0,4);
    B2ptp = mat(index1,4);
    A3ptr = mat(index0,5);
    B3ptr = mat(index1,5); 
    A3ptp = mat(index0,6);
    B3ptp = mat(index1,6);
    Adrebp = mat(index0,7);
    Bdrebp = mat(index1,7);
    Aorebp = mat(index0,8);
    Borebp = mat(index1,8);
    Amakeft = mat(index0,9);
    Bmakeft = mat(index1,9);
    Aortg = mat(index0,11);
    Bortg = mat(index1,11);
    Adrtg = mat(index0,12);
    Bdrtg = mat(index1,12);
    Aoppdrtg = mat(index0,13);
    Boppdrtg = mat(index1,13);


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