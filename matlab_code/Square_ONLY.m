%{

	Code to draw a circle using the gencobot robot with an attachment that holds a pen.
	Author: Rohan Sagar
	Date: May 3- 2018
%}

if ~isempty(instrfind)%if all serial port objects are NOT empty 
    fclose(instrfind);%Close all serial port objects
    delete(instrfind);%Delete all serial port objects
    clear s;
end


%% Open new serial object for the robot
robot = serial('COM4','BaudRate',9600);%Declare serial object for communicating with gencobot
fopen(robot);%Open serial port for gencobot
pause(2); % wait for 2 seconds


%%First switch on the robot
fprintf(robot,'SVN');
pause(0.3);



fprintf(robot,'SSP T,9000');
pause(0.3);
fprintf(robot,'SSP X,9000');
pause(0.3);




% Homing the robot
%fprintf(robot,'HOM');
%pause(0.3);
%wait_for_robot(robot);



%{	
 there are stations set form D to T thet is 17 stations that are situated all across the circumference of the circle.
 We move from one station to another so that a circle is drawn 
%}

% moving through the stations

%______________________________________SQUARE_____________________________________________
fprintf(robot, 'MTP p');
pause(3);

fprintf(robot, 'MTP P');
pause(3);

fprintf(robot, 'MTP p');
pause(3);

fprintf(robot, 'MTP Q');
pause(3);

fprintf(robot, 'MTP q');
pause(3);

fprintf(robot, 'MTP P');
pause(3);

fprintf(robot, 'MTP p');
pause(3);

fprintf(robot, 'SVF');
pause(3);

fprintf(robot, 'MTP P');
pause(3);


if ~isempty(instrfind)%if all serial port objects are NOT empty 
    fclose(instrfind);%Close all serial port objects
    delete(instrfind);%Delete all serial port objects
    clear s;
end

