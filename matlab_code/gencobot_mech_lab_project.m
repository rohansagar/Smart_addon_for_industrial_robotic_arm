%% If a serial object is currently open, close it
if ~isempty(instrfind)%if all serial port objects are NOT empty 
    fclose(instrfind);%Close all serial port objects
    delete(instrfind);%Delete all serial port objects
    clear s;
end

%% Open new serial object for the robot
robot = serial('COM4','BaudRate',9600);%Declare serial object for communicating with gencobot
arduino = serial ('COM3', 'Baudrate', 9600); %% Declare serial object for communicating with arduino
fopen(robot);%Open serial port for gencobot
fopen(arduino); %Open serial port for arduino
pause(2); % wait for 2 seconds
set(arduino,'Terminator','CR')


%%First switch on the robot
fprintf(robot,'SVN');
%wait_for_robot(robot);

% Homing the robot
fprintf(robot,'HOM');
wait_for_robot(robot);
 


% move to initial station
fprintf(robot,'MTP A');
wait_for_robot(robot);

%% THIS IS THE SCANNING ROUTINE
fprintf(robot, 'MVR T,-1080'); %goes to 0:0
wait_for_robot(robot);
a = (get_color_from_arduino(arduino));
color = zeros(9,7);
a=360;
j=1;
i=1;


    for count=1:6 
      temp=get_color_from_arduino(arduino);
      temp(2)
      color(j,i) = (temp(2));
       fprintf(robot, 'MVR T,%d',a); % move right by one block
      wait_for_robot(robot);
    end
    
fprintf(robot,'MVR X,900');
wait_for_robot(robot);
a=-(a);


     for count=1:6 
      temp=get_color_from_arduino(arduino);
      temp(2)
      color(j,i) = (temp(2));
       fprintf(robot, 'MVR T,%d',a); % move right by one block
      wait_for_robot(robot);
    end

%if ~isempty(instrfind)%if all serial port objects are NOT empty 
%    fclose(instrfind);%Close all serial port objects
%    delete(instrfind);%Delete all serial port objects
%    clear s;
%end