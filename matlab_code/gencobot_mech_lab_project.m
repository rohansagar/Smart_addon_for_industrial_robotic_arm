%% If a serial object is currently open, close it
if ~isempty(instrfind)%if all serial port objects are NOT empty 
    fclose(instrfind);%Close all serial port objects
    delete(instrfind);%Delete all serial port objects
    clear s;
end

%% Open new serial object for the robot
robot = serial('COM4','BaudRate',9600);%Declare serial object for communicating with gencobot
arduino = serial ('COM5', 'Baudrate', 9600); %% Declare serial object for communicating with arduino
fopen(robot);%Open serial port for gencobot
fopen(arduino); %Open serial port for arduino
pause(2);
set(arduino,'Terminator','CR')

%{
%%First switch on the robot
fprintf(robot,'SVN');
%wait_for_robot(robot);
% Homing the robot
fprintf(robot,'HOM');
wait_for_robot(robot);
%}


% move to initial station
fprintf(robot,'MTP A');
wait_for_robot(robot);

%% THIS IS THE SCANNING ROUTINE
fprintf(robot, 'MVR T,-1080'); %goes to 0:0
wait_for_robot(robot);
pause(1);
a = (get_color_from_arduino(arduino));
color = zeros(9,7);
j=1;
i=1;
for i=1:7 
    temp=get_color_from_arduino(arduino);
    color(j,i) = (temp);
    fprintf(robot, 'MVR T,360'); % move right by one block
    wait_for_robot(robot);
    pause(0.5);
    
end

color


%if ~isempty(instrfind)%if all serial port objects are NOT empty 
%    fclose(instrfind);%Close all serial port objects
%    delete(instrfind);%Delete all serial port objects
%    clear s;
%end