%totally_janky_fix

%{

    Gencobot Scanning routine
    Author: Rohan Sagar
    Date: 4-10-18

    This code is used to make the gencobot addon device scan a page for colors
    and then draw lines based in the colors on the page    


%}

%% If a serial object is currently open, close it

clc; 
clear all;
close all;

if ~isempty(instrfind)%if all serial port objects are NOT empty 
    fclose(instrfind);%Close all serial port objects
    delete(instrfind);%Delete all serial port objects
    clear s;
    //
end

%% Open new serial object for the robot
robot = serial('COM3','BaudRate',9600);% this was com 4 Declare serial object for communicating with gencobot
arduino = serial ('COM4', 'Baudrate', 9600); %% this was com 5 Declare serial object for communicating with arduino
fopen(robot);%Open serial port for gencobot
fopen(arduino); %Open serial port for arduino
pause(2); % wait for 2 seconds
set(arduino,'Terminator','CR')

color_matrix=zeros(9,7);

%%First switch on the robot
fprintf(robot,'SVN');
pause(0.3);


% set speeds for all the axes.
fprintf(robot,'SSP T,9000');
pause(0.3);
fprintf(robot,'SSP X,9000');
pause(0.3);
fprintf(robot,'SSP R,9000');
pause(0.3);
fprintf(robot,'SSP R2,9000');
pause(0.3);
fprintf(robot,'SSP Z,9000');
pause(0.3);




%{
% Homing the robot
fprintf(robot,'HOM');
pause(0.3);
wait_for_robot(robot);
%}

fprintf(robot, 'MVR Z,2000');
pause(3);

% move to initial station
fprintf(robot,'MTP A');
pause(0.4);
waitReceive(a,robot);

pause(2);

fprintf(robot, 'MVR T,%d',1080);
pause(0.3);
wait_for_robot(robot);
temp = get_color_from_arduino(arduino);
color_matrix(1,1)=temp(1)-48;
take_color_and_draw(color_matrix(1,1),robot);
