%{
    text.m
    Author: Rohan Sagar
	Date: May 3- 2018
    This code is used to Write SFSU on a paper

    The gencobot is capable of storing the positions of statios and moving from one station to 
    another. We use this feature of the robot to store some points along the test and move
    through them to draw the test.
    %}

close_serial_ports(); % close all the serial ports if any are open

%% Open new serial object for the robot
robot = serial('COM4','BaudRate',9600);%Declare serial object for communicating with gencobot
% note that COM4 is for a windows computer, in mac it will look like /dev/ttyusb2
fopen(robot);%Open serial port for gencobot
pause(2); % wait for 2 seconds


%%First switch on the robot
fprintf(robot,'SVN'); % SVN is the command to switch on the robot
pause(0.3); 



fprintf(robot,'SSP T,9000'); % setting the speed of the robot along T axis to 9000
pause(0.3);
fprintf(robot,'SSP X,9000'); % setting the speed of the robot along X axis to 9000
pause(0.3);





% Homing the robot (this is optional use this only if the robot is just switched on)
%fprintf(robot,'HOM');
%pause(0.3);
%wait_for_robot(robot);


%{
Moving through the stations
- MTP is the command used to go to a specific station and the letter following the command is
the name of the station
%}

%______________________________________SQUARE_____________________________________________
fprintf(robot, 'MTP R');
pause(3);

fprintf(robot, 'MTP r');
pause(3);

fprintf(robot, 'MTP S');
pause(3);

fprintf(robot, 'MTP s');
pause(3);

fprintf(robot, 'MTP T');
pause(3);

fprintf(robot, 'MTP t');
pause(3);

fprintf(robot, 'MTP U');
pause(3);

fprintf(robot, 'MTP t');
pause(3);

fprintf(robot, 'MTP u');
pause(3);

fprintf(robot, 'MTP V');
pause(3);

fprintf(robot, 'MTP v');
pause(3);

fprintf(robot, 'MTP W');
pause(3);

fprintf(robot, 'MTP w');
pause(3);

fprintf(robot, 'MTP X');
pause(3);

fprintf(robot, 'MTP x');
pause(3);

fprintf(robot, 'MTP Y');
pause(3);

fprintf(robot, 'MTP x');
pause(3);

fprintf(robot, 'MTP y');
pause(3);

fprintf(robot, 'MTP Z');
pause(3);

fprintf(robot, 'SVF');
pause(3);

fprintf(robot, 'MTP Z');
pause(3);


close_serial_ports(); % close all the ports

fprintf(robot, 'SVF'); % SVF is the command to switch off the servos of the robot.
pause(2);

