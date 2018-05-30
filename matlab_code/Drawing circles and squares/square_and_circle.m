%{
    square_and_circle.m
	Author: Rohan Sagar
	Date: May 3- 2018
	Code to draw a square and a circle using the gencobot robot with an attachment that holds a pen.

    The gencobot is capable of storing the positions of statios and moving from one station to 
    another. We use this feature of the robot to store the corners of a square and points along
    the circumference of the circle and move through then to draw a circle and a square.    
%}
close_serial_ports();


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
%____________________________________CIRCLE__________________________________________________________

fprintf(robot, 'MTP C');
pause(3);
fprintf(robot, 'MTP c');
pause(3);

fprintf(robot, 'MTP D');
pause(3);

fprintf(robot, 'MTP d');
pause(3);

fprintf(robot, 'MTP E');
pause(3);

fprintf(robot, 'MTP e');
pause(3);

fprintf(robot, 'MTP F');
pause(3);

fprintf(robot, 'MTP f');
pause(3);

fprintf(robot, 'MTP G');
pause(3);

fprintf(robot, 'MTP g');
pause(3);

fprintf(robot, 'MTP H');
pause(3);

fprintf(robot, 'MTP h');
pause(3);

fprintf(robot, 'MTP I');
pause(3);

fprintf(robot, 'MTP i');
pause(3);

fprintf(robot, 'MTP J');
pause(3);

fprintf(robot, 'MTP j');
pause(3);

fprintf(robot, 'MTP K');
pause(3);

fprintf(robot, 'MTP k');
pause(3);


fprintf(robot, 'MTP L');
pause(3);

fprintf(robot, 'MTP l');
pause(3);

fprintf(robot, 'MTP M');
pause(3);

fprintf(robot, 'MTP m');
pause(3);

fprintf(robot, 'MTP N');
pause(3);

fprintf(robot, 'MTP n');
pause(3);

fprintf(robot, 'MTP O');
pause(3);

fprintf(robot, 'MTP o');
pause(3);

fprintf(robot, 'MTP C');
pause(3);


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


fprintf(robot, 'SVF');
pause(3);

fprintf(robot, 'MTP P');
pause(3);

fprintf(robot, 'MTP p');
pause(3);

close_serial_ports();

fprintf(robot, 'SVF'); % SVF is the command to switch off the servos of the robot.
pause(2);

