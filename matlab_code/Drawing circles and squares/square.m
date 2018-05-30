%{

square.m    
Author: Rohan Sagar
Date: May 3- 2018
Code to draw a circle using the gencobot robot with an attachment that holds a pen.

The gencobot is capable of storing the positions of statios and moving from one station to 
another. We use this feature of the robot to store the corners of a square and move from
one corner to anoteher until we form a square
%}


close_serial_ports();


%% Open new serial object for the robot
robot = serial('COM4','BaudRate',9600);%Declare serial object for communicating with gencobot
% note that COM4 is for a windows computer, in mac it will look like /dev/ttyusb2

fopen(robot);%Open serial port for gencobot
pause(2); % wait for 2 seconds for the port to open


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


close_serial_ports(); % close the open  serial ports since the program execution is done.

fprintf(robot, 'SVF'); % SVF is the command to switch off the servos of the robot.
pause(2);

