function goto_green_home(robot)
    g_home= []; % theese are the positions for the green home
    fprintf(robot, 'MVA T,%d',g_home(1));
    pause(2);
    fprintf(robot,'MVA X,%d',g_home());
    pause(2);
    fpintf(robot,'MVA R,%d',g_home());
    pause(2);
     fpintf(robot,'MVA R1,%d',g_home());
    pause(2);
    
end