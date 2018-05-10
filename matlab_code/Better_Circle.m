%{
_____________________________________________________________________
Code to draw a circle using the gencobot robot with an attachment 
that holds a pen.
Author: Rohan Sagar
Date: May 3- 2018
_____________________________________________________________________
The robot is designed to move from station to station moving
discs. Hence we use stations to mark points along the circumference 
of the circle and then move from one station to another thus creating
a circular path. 
_____________________________________________________________________
%}


% First we make sure that all the serial ports are closed

if ~isempty(instrfind)%if all serial port objects are NOT empty 
    fclose(instrfind);%Close all serial port objects
    delete(instrfind);%Delete all serial port objects
    clear s;
end


% We initialize new serial object for the robot with the robot and call it robot
robot = serial('COM4','BaudRate',9600);%Declare serial object for communicating with gencobot

%{
COM4 is the port assigend by the computer to the robot when it is plugged in.
It changes from one computer to another and can be found out by looking under
ports tab in Device Manager.
The other two arguments BaudRate and 9600 set the baud rate to 9600 which is the 
default communication speed
%}

fopen(robot);%Open serial port for gencobot
pause(2); % wait for 2 seconds to make sure the serial port is open before we start communicating


%%First switch on the robot
% fprintf is a function used to send data through the serial port
fprintf(robot,'SVN'); % SVN is the command used to switch on the servos of the robot
pause(0.3); % we use this to give a delay of 0.3 seconds


% before we actually start moving we set the speed of the robot along all the axes
% the command SSP stands for set speed the alphabet next to it is the axis and the  number is the speed of the robot
fprintf(robot,'SSP T,9000'); % setting speed across T axis
pause(0.3);
fprintf(robot,'SSP X,9000'); % setting speed across X axis
pause(0.3);
fprintf(robot,'SSP R,9000'); % setting speed across R axis 
pause(0.3);
fprintf(robot,'SSP R2,9000'); % setting speed across R2 axis
pause(0.3);



% Homing the robot
% This portion of the code only needs to be executed if the robot just switched on. It is used to caliberate the encoders in the robot

%{
fprintf(robot,'HOM');
pause(0.3);
wait_for_robot(robot);
%}


%{	
 there are stations set from D to T. These stations are situated all across the circumference of the circle.
 We move from one station to another so that a circle is drawn.
%}

% moving through the stations
% the command MTP is to go to a station. The letter after MTP is the name of the station.
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

fprintf(robot, 'MTP P');
pause(3);

fprintf(robot, 'MTP p');
pause(3);

fprintf(robot, 'MTP D');
pause(3);

fprintf(robot, 'SVF'); % SVF is a command to switch off the servos of the robot
pause(3);

% Finally before we end the program we close the ports that we openedfor the program to communicate with the robot.
if ~isempty(instrfind)%if all serial port objects are NOT empty 
    fclose(instrfind);%Close all serial port objects
    delete(instrfind);%Delete all serial port objects
    clear s;
end


