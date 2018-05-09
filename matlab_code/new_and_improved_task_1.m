% new and improved code

% close all existing ports
clc;
clear all;
close all;

if ~isempty(instrfind)%if all serial port objects are NOT empty 
    fclose(instrfind);%Close all serial port objects
    delete(instrfind);%Delete all serial port objects
    clear s;
end

%open the ports needed
robot = serial('COM4','BaudRate',9600);%Declare serial object for communicating with gencobot
arduino = serial ('COM5', 'Baudrate', 9600); %% Declare serial object for communicating with arduino
fopen(robot);%Open serial port for gencobot
fopen(arduino); %Open serial port for arduino
pause(2); % wait for 2 seconds
set(arduino,'Terminator','CR')
% declaring a matrix for storing colors
color_matrix=zeros(9,7);




%%First switch on the robot
fprintf(robot,'SVN');
pause(0.3);



fprintf(robot,'SSP T,9000');
pause(0.3);
fprintf(robot,'SSP X,9000');
pause(0.3);



%{
% Homing the robot
fprintf(robot,'HOM');
pause(0.3);
wait_for_robot(robot);
%}


% A=[T,R ,R2 ,X,Z]
Z=1550;



a1=[-15580,-7053,2755,-14460,Z];
a2=[-15220,-7053,2755,-14460,Z];
a3=[-14860,-7053,2755,-14460,Z];
a4=[-14500,-7053,2755,-14460,Z];
a =[-14500,-7053,2755,-14460,Z];
a5=[-14140,-7053,2755,-14460,Z];
a6=[-13780,-7053,2755,-14460,Z];
a7=[-13420,-7053,2755,-14460,Z];


b1=[-15848,-7053,2755,-13560,Z];
b2=[-15488,-7053,2755,-13560,Z];
b3=[-15128,-7053,2755,-13560,Z];
b4=[-14768,-7053,2755,-13560,Z];
b5=[-14408,-7053,2755,-13560,Z];
b6=[-14048,-7053,2755,-13560,Z];
b7=[-13688,-7053,2755,-13560,Z];

c1=[-16107,-7053,2755,-12660,Z];
c2=[-15747,-7053,2755,-12660,Z];
c3=[-15387,-7053,2755,-12660,Z];
c4=[-15027,-7053,2755,-12660,Z];
c5=[-14667,-7053,2755,-12660,Z];
c6=[-14307,-7053,2755,-12660,Z];
c7=[-13947,-7053,2755,-12660,Z];

d1=[-16360,-7053,2755,-11760,Z];
d2=[-16000,-7053,2755,-11760,Z];
d3=[-15640,-7053,2755,-11760,Z];
d4=[-15280,-7053,2755,-11760,Z];
d5=[-14920,-7053,2755,-11760,Z];
d6=[-14560,-7053,2755,-11760,Z];
d7=[-14200,-7053,2755,-11760,Z];


e1=[-16606,-7053,2755,-10860,Z];
e2=[-16246,-7053,2755,-10860,Z];
e3=[-15886,-7053,2755,-10860,Z];
e4=[-15526,-7053,2755,-10860,Z];
e5=[-15166,-7053,2755,-10860,Z];
e6=[-14806,-7053,2755,-10860,Z];
e7=[-14446,-7053,2755,-10860,Z];

f7=[-14687,-7053,2755,-9960,Z];
f6=[-15047,-7053,2755,-9960,Z];
f5=[-15407,-7053,2755,-9960,Z];
f4=[-15767,-7053,2755,-9960,Z];
f3=[-16127,-7053,2755,-9960,Z];
f2=[-16487,-7053,2755,-9960,Z];
f1=[-16847,-7053,2755,-9960,Z];

g1=[-17083,-7053,2755,-9060,Z];
g2=[-16723,-7053,2755,-9060,Z];
g3=[-16363,-7053,2755,-9060,Z];
g4=[-16003,-7053,2755,-9060,Z];
g5=[-15643,-7053,2755,-9060,Z];
g6=[-15283,-7053,2755,-9060,Z];
g7=[-14923,-7053,2755,-9060,Z];


h7=[-15156,-7053,2755,-8160,Z];
h6=[-15516,-7053,2755,-8160,Z];
h5=[-15876,-7053,2755,-8160,Z];
h4=[-16236,-7053,2755,-8160,Z];
h3=[-16596,-7053,2755,-8160,Z];
h2=[-16956,-7053,2755,-8160,Z];
h1=[-17316,-7053,2755,-8160,Z];

i1=[-17570,-7053,2755,-7160,Z];
i2=[-17210,-7053,2755,-7160,Z];
i3=[-16850,-7053,2755,-7160,Z];
i4=[-16490,-7053,2755,-7160,Z];
i5=[-16130,-7053,2755,-7160,Z];
i6=[-15770,-7053,2755,-7160,Z];
i7=[-15410,-7053,2755,-7160,Z];

A=[a1,a2,a3,a4,a5,a6,a7];
B=[b1,b2,b3,b4,b5,b6,b7];
C=[c1,c2,c3,c4,c5,c6,c7];
D=[d1,d2,d3,d4,d5,d6,d7];
E=[e1,e2,e3,e4,e5,e6,e7];
F=[f1,f2,f3,f4,f5,f6,f7];
G=[g1,g2,g3,g4,g5,g6,g7];
H=[h1,h2,h3,h4,h5,h6,h7];
I=[i1,i2,i3,i4,i5,i6,i7];

full = [A;B;C;D;E;F;G;H;I];


% Move up to avoid colison with the table
fprintf(robot, 'MVA Z,%d',a(4));
pause(2);
fprintf(robot, 'MVR Z,1000');


% move to initial station
fprintf(robot,'MTP A');
pause(0.4);
waitReceive(a,robot);

pause(2);

for i=1:9
    for j=1:7
        k=4*(j-1);
        fprintf(robot,'MVA T,%d',full(i,k+1));
        pause(4);
        fprintf(robot,'MVA R,%d',full(i,(k+2)));
        pause(4);
        fprintf(robot,'MVA R2,%d',full(i,k+3));
        pause(4);        
        fprintf(robot,'MVA X,%d',full(i,k+4));
        pause(4);
        fprintf(robot,'MVA Z,%d',full(i,k+5));
        pause(4);

    end

end
