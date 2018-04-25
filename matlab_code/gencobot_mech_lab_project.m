%% If a serial object is currently open, close it
clc;
clear all;
close all;

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

color_matrix=zeros(9,7);

%%First switch on the robot
fprintf(robot,'SVN');
pause(0.3);


%{
% Homing the robot
fprintf(robot,'HOM');
pause(0.3);
wait_for_robot(robot);
%}


% A=[T, , ,X,Z]

a1=[-15580,-7053,2755,-14460,1085];
a2=[-15220,-7053,2755,-14460,1085];
a3=[-14860,-7053,2755,-14460,1085];
a4=[-14500,-7053,2755,-14460,1085];
a =[-14500,-7053,2755,-14460,1085];
a5=[-14140,-7053,2755,-14460,1085];
a6=[-13780,-7053,2755,-14460,1085];
a7=[-13420,-7053,2755,-14460,1085];


b1=[-15848,-7053,2755,-13560,1085];
b2=[-15488,-7053,2755,-13560,1085];
b3=[-15128,-7053,2755,-13560,1085];
b4=[-14768,-7053,2755,-13560,1085];
b5=[-14408,-7053,2755,-13560,1085];
b6=[-14048,-7053,2755,-13560,1085];
b7=[-13688,-7053,2755,-13560,1085];

c1=[-16107,-7053,2755,-12660,1085];
c2=[-15747,-7053,2755,-12660,1085];
c3=[-15387,-7053,2755,-12660,1085];
c4=[-15027,-7053,2755,-12660,1085];
c5=[-14667,-7053,2755,-12660,1085];
c6=[-14307,-7053,2755,-12660,1085];
c7=[-13947,-7053,2755,-12660,1085];

d1=[-16360,-7053,2755,-11760,1085];
d2=[-16000,-7053,2755,-11760,1085];
d3=[-15640,-7053,2755,-11760,1085];
d4=[-15280,-7053,2755,-11760,1085];
d5=[-14920,-7053,2755,-11760,1085];
d6=[-14560,-7053,2755,-11760,1085];
d7=[-14200,-7053,2755,-11760,1085];


e1=[-16360,-7053,2755,-10860,1085];
e2=[-16000,-7053,2755,-10860,1085];
e3=[-15640,-7053,2755,-10860,1085];
e4=[-15280,-7053,2755,-10860,1085];
e5=[-14920,-7053,2755,-10860,1085];
e6=[-14560,-7053,2755,-10860,1085];
e7=[-14200,-7053,2755,-10860,1085];

f1
f2
f3
f4
f5
f6
f7

g1
g2
g3
g4
g5
g6
g7

h1
h2
h3
h4
h5
h6
h7

i1
i2
i3
i4
i5
i6
i7




% move to initial station
fprintf(robot,'MTP A');
pause(0.4);
waitReceive(a,robot);

fprintf(robot, 'MVA T,%d',a1(1));
pause(0.3);
waitReceive(a1,robot);
temp = get_color_from_arduino(arduino);
color_matrix(1,1)=temp(1)-48;


fprintf(robot, 'MVA T,%d',a2(1));
pause(0.3);
waitReceive(a2,robot);
temp = get_color_from_arduino(arduino);
color_matrix(1,2)=temp(2)-48;

fprintf(robot, 'MVA T,%d',a3(1));
pause(0.3);
waitReceive(a3,robot);
temp = get_color_from_arduino(arduino);
color_matrix(1,3)=temp(2)-48;

fprintf(robot, 'MVA T,%d',a4(1));
pause(0.3);
waitReceive(a4,robot);
temp = get_color_from_arduino(arduino);
color_matrix(1,4)=temp(2)-48;

fprintf(robot, 'MVA T,%d',a5(1));
pause(0.3);
waitReceive(a5,robot);
temp = get_color_from_arduino(arduino);
color_matrix(1,5)=temp(2)-48;

fprintf(robot, 'MVA T,%d',a6(1));
pause(0.3);
waitReceive(a6,robot);
temp = get_color_from_arduino(arduino);
color_matrix(1,6)=temp(2)-48;

fprintf(robot, 'MVA T,%d',a7(1));
pause(0.3);
waitReceive(a7,robot);
temp = get_color_from_arduino(arduino);
color_matrix(1,7)=temp(2)-48;

pause(1);

fprintf(robot,'MVA X,%d', b7(4));
pause(0.3);
waitReceive(b7,robot);
temp = get_color_from_arduino(arduino);
color_matrix(2,7)=temp(2)-48;

fprintf(robot, 'MVA T,%d',b6(1));
pause(0.3);
waitReceive(b6,robot);
temp = get_color_from_arduino(arduino);
color_matrix(2,6)=temp(2)-48;

fprintf(robot, 'MVA T,%d',b5(1));
pause(0.3);
waitReceive(b5,robot);
temp = get_color_from_arduino(arduino);
color_matrix(2,5)=temp(2)-48;

fprintf(robot, 'MVA T,%d',b4(1));
pause(0.3);
waitReceive(b4,robot);
temp = get_color_from_arduino(arduino);
color_matrix(2,4)=temp(2)-48;

fprintf(robot, 'MVA T,%d',b3(1));
pause(0.3);
waitReceive(b3,robot);
temp = get_color_from_arduino(arduino);
color_matrix(2,3)=temp(2)-48;

fprintf(robot, 'MVA T,%d',b2(1));
pause(0.3);
waitReceive(b2,robot);
temp = get_color_from_arduino(arduino);
color_matrix(2,2)=temp(2)-48;

fprintf(robot, 'MVA T,%d',b1(1));
pause(0.3);
waitReceive(b1,robot);
temp = get_color_from_arduino(arduino);
color_matrix(2,1)=temp(2)-48;


fprintf(robot, 'MVA X,%d',c1(4));
pause(0.3);
waitReceive(c1,robot);
temp = get_color_from_arduino(arduino);
color_matrix(3,1)=temp(2)-48;

fprintf(robot, 'MVA T,%d',c2(1));
pause(0.3);
waitReceive(c2,robot);
temp = get_color_from_arduino(arduino);
color_matrix(3,2)=temp(2)-48;

fprintf(robot, 'MVA T,%d',c3(1));
pause(0.3);
waitReceive(c3,robot);
temp = get_color_from_arduino(arduino);
color_matrix(3,3)=temp(2)-48;

fprintf(robot, 'MVA T,%d',c4(1));
pause(0.3);
waitReceive(c4,robot);
temp = get_color_from_arduino(arduino);
color_matrix(3,4)=temp(2)-48;


fprintf(robot, 'MVA T,%d',c5(1));
pause(0.3);
waitReceive(c5,robot);
temp = get_color_from_arduino(arduino);
color_matrix(3,5)=temp(2)-48;


fprintf(robot, 'MVA T,%d',c6(1));
pause(0.3);
waitReceive(c6,robot);
temp = get_color_from_arduino(arduino);
color_matrix(3,6)=temp(2)-48;

fprintf(robot, 'MVA T,%d',c7(1));
pause(0.3);
waitReceive(c7,robot);
temp = get_color_from_arduino(arduino);
color_matrix(3,7)=temp(2)-48;

fprintf(robot, 'MVA X,%d',d7(4));
pause(0.3);
waitReceive(d7,robot);
temp = get_color_from_arduino(arduino);
color_matrix(4,7)=temp(2)-48;

fprintf(robot, 'MVA T,%d',c6(1));
pause(0.3);
waitReceive(c6,robot);
temp = get_color_from_arduino(arduino);
color_matrix(4,6)=temp(2)-48;

fprintf(robot, 'MVA T,%d',d5(1));
pause(0.3);
waitReceive(d5,robot);
temp = get_color_from_arduino(arduino);
color_matrix(3,5)=temp(2)-48;

fprintf(robot, 'MVA T,%d',d4(1));
pause(0.3);
waitReceive(d4,robot);
temp = get_color_from_arduino(arduino);
color_matrix(3,4)=temp(2)-48;

fprintf(robot, 'MVA T,%d',d3(1));
pause(0.3);
waitReceive(d3,robot);
temp = get_color_from_arduino(arduino);
color_matrix(3,4)=temp(2)-48;

fprintf(robot, 'MVA T,%d',d2(1));
pause(0.3);
waitReceive(d2,robot);
temp = get_color_from_arduino(arduino);
color_matrix(3,2)=temp(2)-48;


fprintf(robot, 'MVA T,%d',d1(1));
pause(0.3);
waitReceive(d1,robot);
temp = get_color_from_arduino(arduino);
color_matrix(3,1)=temp(2)-48;


fprintf(root, 'MVA X,%d' e1(4));
pause(0.3);
waitReceive(e1,robot);







if ~isempty(instrfind)%if all serial port objects are NOT empty 
    fclose(instrfind);%Close all serial port objects
    delete(instrfind);%Delete all serial port objects
    clear s;
end