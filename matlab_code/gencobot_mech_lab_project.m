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


% A=[T, , ,X,Z]
Z=1550;


% below are the co ordinates of all the squares

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

c1=[-16107,-7053,2755,-12660,Z]; % all these were 660
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
%____________________________________________________________________________________________________________________________________________________


fprintf(robot, 'MVA Z,%d',a(4));
pause(2);
fprintf(robot, 'MVR Z,1000');


% move to initial station
fprintf(robot,'MTP A');
pause(0.4);
waitReceive(a,robot);

pause(2);

%_______________________________________________________________________________________________________
fprintf(robot, 'MVA T,%d',a1(1));
pause(0.3);
waitReceive(a1,robot);
temp = get_color_from_arduino(arduino);
color_matrix(1,1)=temp(1)-48;
take_color_and_draw(color_matrix(1,1),robot);

%_____________________________________________________________________________________________________________________________________________________
    
fprintf(robot, 'MVA T,%d',a2(1));
pause(0.3);
waitReceive(a2,robot);
temp = get_color_from_arduino(arduino);
color_matrix(1,2)=temp(2)-48;
take_color_and_draw(color_matrix(1,2),robot);

%_____________________________________________________________________________________________________________________________________________________

fprintf(robot, 'MVA T,%d',a3(1));
pause(0.3);
waitReceive(a3,robot);
temp = get_color_from_arduino(arduino);
color_matrix(1,3)=temp(2)-48;
take_color_and_draw(color_matrix(1,3),robot);

%_____________________________________________________________________________________________________________________________________________________

fprintf(robot, 'MVA T,%d',a4(1));
pause(0.3);
waitReceive(a4,robot);
temp = get_color_from_arduino(arduino);
color_matrix(1,4)=temp(2)-48;
take_color_and_draw(color_matrix(1,4),robot);

%_____________________________________________________________________________________________________________________________________________________

fprintf(robot, 'MVA T,%d',a5(1));
pause(0.3);
waitReceive(a5,robot);
temp = get_color_from_arduino(arduino);
color_matrix(1,5)=temp(2)-48;
take_color_and_draw(color_matrix(1,5),robot);

%_____________________________________________________________________________________________________________________________________________________

fprintf(robot, 'MVA T,%d',a6(1));
pause(0.3);
waitReceive(a6,robot);
temp = get_color_from_arduino(arduino);
color_matrix(1,6)=temp(2)-48;
take_color_and_draw(color_matrix(1,6),robot);

%_____________________________________________________________________________________________________________________________________________________

fprintf(robot, 'MVA T,%d',a7(1));
pause(0.3);
waitReceive(a7,robot);
temp = get_color_from_arduino(arduino);
color_matrix(1,7)=temp(2)-48;
take_color_and_draw(color_matrix(1,7),robot);

%_________________________________________________________________________________________________________________________________________

fprintf(robot,'MVA X,%d', b7(4));
pause(0.3);
waitReceive(b7,robot);
temp = get_color_from_arduino(arduino);
color_matrix(2,7)=temp(2)-48;
take_color_and_draw(color_matrix(2,7),robot);

%_____________________________________________________________________________________________________________________________________________________

fprintf(robot, 'MVA T,%d',b6(1));
pause(0.3);
waitReceive(b6,robot);
temp = get_color_from_arduino(arduino);
color_matrix(2,6)=temp(2)-48;
take_color_and_draw(color_matrix(2,6),robot);

%_____________________________________________________________________________________________________________________________________________________

fprintf(robot, 'MVA T,%d',b5(1));
pause(0.3);
waitReceive(b5,robot);
temp = get_color_from_arduino(arduino);
color_matrix(2,5)=temp(2)-48;
take_color_and_draw(color_matrix(2,5),robot);

%_____________________________________________________________________________________________________________________________________________________

fprintf(robot, 'MVA T,%d',b4(1));
pause(0.3);
waitReceive(b4,robot);
temp = get_color_from_arduino(arduino);
color_matrix(2,4)=temp(2)-48;
take_color_and_draw(color_matrix(2,4),robot);

%_____________________________________________________________________________________________________________________________________________________

fprintf(robot, 'MVA T,%d',b3(1));
pause(0.3);
waitReceive(b3,robot);
temp = get_color_from_arduino(arduino);
color_matrix(2,3)=temp(2)-48;
take_color_and_draw(color_matrix(2,3),robot);

%_____________________________________________________________________________________________________________________________________________________

fprintf(robot, 'MVA T,%d',b2(1));
pause(0.3);
waitReceive(b2,robot);
temp = get_color_from_arduino(arduino);
color_matrix(2,2)=temp(2)-48;
take_color_and_draw(color_matrix(2,2),robot);



















%_____________________________________________________________________________________________________________________________________________________




% the Drawing portion is implemented in the following square only


%{
fprintf(robot, 'MVA T,%d',b1(1));
pause(0.3);
waitReceive(b1,robot);
temp = get_color_from_arduino(arduino);
color_matrix(2,1)=temp(2)-48;
if(color_matrix(2,1) == 1)% If red color is detected
   
    % set the current location as a station so that we can come back to it after drawing when we want to resume scanning 
    fprintf(robot, 'NTC a');% this command is used to start teaching a station named 'a'
    pause(1);
    fprintf(robot, 'ENT 1'); % a part of teaching routine
    pause(1);
    fprintf(robot, 'SAV'); % save the station to not volatile memory
    pause(1); 
    % move up to avoid clearance issues 
    fprintf(robot, 'MVR Z,1000');
    wait_for_robot(robot); 

        % this function gets the robot into a position from which it can draw
    goto_drawing_stage(robot);
% change this if you want to match the red squares to any location other than 4
    fprintf(robot,'MTP B'); % this is the station that allows us to go to 4 since we have to match the square with red to 4
    pause(6);

    fprintf(robot, 'MVR Z,2000');% this is to lift up the pen so that the robot is not drawing anymore
    pause(6);
    fprintf(robot,'MTP a'); % go to the station that we saved before so that we can resume scanning from there
    pause(6);

end

if (color_matrix(2,1)==2) % if green color is detected
    
    % set the current location as a station so that we can come back to it after drawing when we want to resume scanning 
    fprintf(robot, 'NTC a');% this command is used to start teaching a station named 'a'
    pause(1);
    fprintf(robot, 'ENT 1'); % a part of teaching routine
    pause(1);
    fprintf(robot, 'SAV'); % save the station to not volatile memory
    pause(1); 
    % move up to avoid clearance issues 
    fprintf(robot, 'MVR Z,1000');
    wait_for_robot(robot); 

    % this function gets the robot into a position from which it can draw
    goto_drawing_stage(robot);

    % change this if you want to match the green squares to any location other than E
    fprintf(robot,'MTP b'); % this is the station that allows us to go to E since we have to match the square with green to E
    pause(6);

    fprintf(robot, 'MVR Z,2000');% this is to lift up the pen so that the robot is not drawing anymore
    pause(6);
    fprintf(robot,'MTP a'); % go to the station that we saved before so that we can resume scanning from there
    pause(6);
end

%_____________________________________________________________________________________________________________________________________________________



%}










%#######################################################################

















%_____________________________________________________________________________________________________________________________________________________




% the Drawing portion is implemented in the following square only



fprintf(robot, 'MVA T,%d',b1(1));
pause(0.3);
waitReceive(b1,robot);
temp = get_color_from_arduino(arduino);
color_matrix(2,1)=temp(2)-48;
take_color_and_draw(color_matrix(2,1),robot);
%_____________________________________________________________________________________________________________________________________________________














%###########################################################################














%_____________________________________________________________________________________________________________________________________________________


fprintf(robot, 'MVA X,%d',c1(4));
pause(0.3);
waitReceive(c1,robot);
temp = get_color_from_arduino(arduino);
color_matrix(3,1)=temp(2)-48;
take_color_and_draw(color_matrix(3,1),robot);

%____________________________________________________________________________________________________________________________________________________

fprintf(robot, 'MVA T,%d',c2(1));
pause(0.3);
waitReceive(c2,robot);
temp = get_color_from_arduino(arduino);
color_matrix(3,2)=temp(2)-48;
take_color_and_draw(color_matrix(3,2),robot);

%_____________________________________________________________________________________________________________________________________________________

fprintf(robot, 'MVA T,%d',c3(1));
pause(0.3);
waitReceive(c3,robot);
temp = get_color_from_arduino(arduino);
color_matrix(3,3)=temp(2)-48;
take_color_and_draw(color_matrix(3,3),robot);


%_____________________________________________________________________________________________________________________________________________________

fprintf(robot, 'MVA T,%d',c4(1));
pause(0.3);
waitReceive(c4,robot);
temp = get_color_from_arduino(arduino);
color_matrix(3,4)=temp(2)-48;
take_color_and_draw(color_matrix(3,4),robot);

%_____________________________________________________________________________________________________________________________________________________

fprintf(robot, 'MVA T,%d',c5(1));
pause(0.3);
waitReceive(c5,robot);
temp = get_color_from_arduino(arduino);
color_matrix(3,5)=temp(2)-48;
take_color_and_draw(color_matrix(3,5),robot);

%_____________________________________________________________________________________________________________________________________________________

fprintf(robot, 'MVA T,%d',c6(1));
pause(0.3);
waitReceive(c6,robot);
temp = get_color_from_arduino(arduino);
color_matrix(3,6)=temp(2)-48;
take_color_and_draw(color_matrix(3,6),robot);

%_____________________________________________________________________________________________________________________________________________________


fprintf(robot, 'MVA T,%d',c7(1));
pause(0.3);
waitReceive(c7,robot);
temp = get_color_from_arduino(arduino);
color_matrix(3,7)=temp(2)-48;
take_color_and_draw(color_matrix(3,7),robot);

%_________________________________________________________________________________________________________________________________
fprintf(robot, 'MVA X,%d',d7(4));
pause(0.3);
waitReceive(d7,robot);
temp = get_color_from_arduino(arduino);
color_matrix(4,7)=temp(2)-48;
take_color_and_draw(color_matrix(4,7),robot);


%_____________________________________________________________________________________________________________________________________________________

fprintf(robot, 'MVA T,%d',d6(1));
pause(0.3);
waitReceive(d6,robot);
temp = get_color_from_arduino(arduino);
color_matrix(4,6)=temp(2)-48;
take_color_and_draw(color_matrix(4,6),robot);


%_____________________________________________________________________________________________________________________________________________________

fprintf(robot, 'MVA T,%d',d5(1));
pause(0.3);
waitReceive(d5,robot);
temp = get_color_from_arduino(arduino);
color_matrix(4,5)=temp(2)-48;
take_color_and_draw(color_matrix(4,5),robot);


%_____________________________________________________________________________________________________________________________________________________

fprintf(robot, 'MVA T,%d',d4(1));
pause(0.3);
waitReceive(d4,robot);
temp = get_color_from_arduino(arduino);
color_matrix(4,4)=temp(2)-48;
take_color_and_draw(color_matrix(4,4),robot);

%_____________________________________________________________________________________________________________________________________________________

fprintf(robot, 'MVA T,%d',d3(1));
pause(0.3);
waitReceive(d3,robot);
temp = get_color_from_arduino(arduino);
color_matrix(4,3)=temp(2)-48;
take_color_and_draw(color_matrix(4,3),robot);

%_____________________________________________________________________________________________________________________________________________________

fprintf(robot, 'MVA T,%d',d2(1));
pause(0.3);
waitReceive(d2,robot);
temp = get_color_from_arduino(arduino);
color_matrix(4,2)=temp(2)-48;
take_color_and_draw(color_matrix(4,2),robot);

%_____________________________________________________________________________________________________________________________________________________

fprintf(robot, 'MVA T,%d',d1(1));
pause(0.3);
waitReceive(d1,robot);
temp = get_color_from_arduino(arduino);
color_matrix(4,1)=temp(2)-48;
take_color_and_draw(color_matrix(4,1),robot);

%_____________________________________________________________________________________________________________________________________________________

fprintf(robot, 'MVR X,900');
pause(0.3);
waitReceive(e1,robot)
temp = get_color_from_arduino(arduino);
color_matrix(5,1)=temp(2)-48;
take_color_and_draw(color_matrix(5,1),robot);

%_____________________________________________________________________________________________________________________________________________________

fprintf(robot, 'MVA T,%d',e2(1));
pause(0.3);
waitReceive(e2,robot);
temp = get_color_from_arduino(arduino);
color_matrix(5,2)=temp(2)-48;
take_color_and_draw(color_matrix(5,2),robot);

%_____________________________________________________________________________________________________________________________________________________

fprintf(robot, 'MVA T,%d',e3(1));
pause(0.3);
waitReceive(e3,robot);
temp = get_color_from_arduino(arduino);
color_matrix(5,3)=temp(2)-48;
take_color_and_draw(color_matrix(5,3),robot);

%_____________________________________________________________________________________________________________________________________________________

fprintf(robot, 'MVA T,%d',e4(1));
pause(0.3);
waitReceive(e4,robot);
temp = get_color_from_arduino(arduino);
color_matrix(5,4)=temp(2)-48;
take_color_and_draw(color_matrix(5,4),robot);

%_____________________________________________________________________________________________________________________________________________________

fprintf(robot, 'MVA T,%d',e5(1));
pause(0.3);
waitReceive(e5,robot);
temp = get_color_from_arduino(arduino);
color_matrix(5,5)=temp(2)-48;
take_color_and_draw(color_matrix(5,5),robot);

%_____________________________________________________________________________________________________________________________________________________

fprintf(robot, 'MVA T,%d',e6(1));
pause(0.3);
waitReceive(e6,robot);
temp = get_color_from_arduino(arduino);
color_matrix(5,6)=temp(2)-48;
take_color_and_draw(color_matrix(5,6),robot);

%_____________________________________________________________________________________________________________________________________________________

fprintf(robot, 'MVA T,%d',e7(1));
pause(0.3);
waitReceive(e7,robot);
temp = get_color_from_arduino(arduino);
color_matrix(5,7)=temp(2)-48;
take_color_and_draw(color_matrix(5,7),robot);

%_________________________________________________________________________________________________________________________


fprintf(robot, 'MVA X,%d',f7(4));
pause(0.3);
waitReceive(f7,robot);
temp = get_color_from_arduino(arduino);
color_matrix(6,7)=temp(2)-48;
take_color_and_draw(color_matrix(6,7),robot);

%_____________________________________________________________________________________________________________________________________________________

fprintf(robot, 'MVA T,%d',f6(1));
pause(0.3);
waitReceive(f6,robot);
temp = get_color_from_arduino(arduino);
color_matrix(6,6)=temp(2)-48;
take_color_and_draw(color_matrix(6,6),robot);

%_____________________________________________________________________________________________________________________________________________________

fprintf(robot, 'MVA T,%d',f5(1));
pause(0.3);
waitReceive(f5,robot);
temp = get_color_from_arduino(arduino);
color_matrix(6,5)=temp(2)-48;
take_color_and_draw(color_matrix(6,5),robot);

%_____________________________________________________________________________________________________________________________________________________

fprintf(robot, 'MVA T,%d',f4(1));
pause(0.3);
waitReceive(f4,robot);
temp = get_color_from_arduino(arduino);
color_matrix(6,4)=temp(2)-48;
take_color_and_draw(color_matrix(6,4),robot);

%_____________________________________________________________________________________________________________________________________________________

fprintf(robot, 'MVA T,%d',f3(1));
pause(0.3);
waitReceive(f3,robot);
temp = get_color_from_arduino(arduino);
color_matrix(6,3)=temp(2)-48;
take_color_and_draw(color_matrix(6,3),robot);

%_____________________________________________________________________________________________________________________________________________________

fprintf(robot, 'MVA T,%d',f2(1));
pause(0.3);
waitReceive(f2,robot);
temp = get_color_from_arduino(arduino);
color_matrix(6,2)=temp(2)-48;
take_color_and_draw(color_matrix(6,2),robot);

%_____________________________________________________________________________________________________________________________________________________

fprintf(robot, 'MVA T,%d',f1(1));
pause(0.3);
waitReceive(f1,robot);
temp = get_color_from_arduino(arduino);
color_matrix(6,1)=temp(2)-48;
take_color_and_draw(color_matrix(6,1),robot);

%________________________________________________________________________________________________________________________________________

fprintf(robot, 'MVA X,%d',g1(4));
pause(0.3);
waitReceive(g1,robot);
temp = get_color_from_arduino(arduino);
color_matrix(7,1)=temp(2)-48;
take_color_and_draw(color_matrix(7,1),robot);

%____________________________________________________________________________________________________________________________________________________

fprintf(robot, 'MVA T,%d',g2(1));
pause(0.3);
waitReceive(g2,robot);
temp = get_color_from_arduino(arduino);
color_matrix(7,2)=temp(2)-48;
take_color_and_draw(color_matrix(7,2),robot);

%_____________________________________________________________________________________________________________________________________________________

fprintf(robot, 'MVA T,%d',g3(1));
pause(0.3);
waitReceive(g3,robot);
temp = get_color_from_arduino(arduino);
color_matrix(7,3)=temp(2)-48;
take_color_and_draw(color_matrix(7,3),robot);

%_____________________________________________________________________________________________________________________________________________________

fprintf(robot, 'MVA T,%d',g4(1));
pause(0.3);
waitReceive(g4,robot);
temp = get_color_from_arduino(arduino);
color_matrix(7,4)=temp(2)-48;
take_color_and_draw(color_matrix(7,4),robot);

%_____________________________________________________________________________________________________________________________________________________

fprintf(robot, 'MVA T,%d',g5(1));
pause(0.3);
waitReceive(g5,robot);
temp = get_color_from_arduino(arduino);
color_matrix(7,5)=temp(2)-48;
take_color_and_draw(color_matrix(7,5),robot);

%_____________________________________________________________________________________________________________________________________________________

fprintf(robot, 'MVA T,%d',g6(1));
pause(0.3);
waitReceive(g6,robot);
temp = get_color_from_arduino(arduino);
color_matrix(7,6)=temp(2)-48;
take_color_and_draw(color_matrix(7,6),robot);

%_____________________________________________________________________________________________________________________________________________________

fprintf(robot, 'MVA T,%d',g7(1));
pause(0.3);
waitReceive(g7,robot);
temp = get_color_from_arduino(arduino);
color_matrix(7,7)=temp(2)-48;
take_color_and_draw(color_matrix(7,7),robot);


%______________________________________________________________________________________________________________________________________________



fprintf(robot, 'MVA X,%d',h7(4));
pause(0.3);
waitReceive(h7,robot);
temp = get_color_from_arduino(arduino);
color_matrix(8,7)=temp(2)-48;
take_color_and_draw(color_matrix(8,7),robot);

%_____________________________________________________________________________________________________________________________________________________

fprintf(robot, 'MVA T,%d',h6(1));
pause(0.3);
waitReceive(h6,robot);
temp = get_color_from_arduino(arduino);
color_matrix(8,6)=temp(2)-48;
take_color_and_draw(color_matrix(8,6),robot);

%_____________________________________________________________________________________________________________________________________________________

fprintf(robot, 'MVA T,%d',h5(1));
pause(0.3);
waitReceive(h5,robot);
temp = get_color_from_arduino(arduino);
color_matrix(8,5)=temp(2)-48;
take_color_and_draw(color_matrix(8,5),robot);

%_____________________________________________________________________________________________________________________________________________________

fprintf(robot, 'MVA T,%d',h4(1));
pause(0.3);
waitReceive(h4,robot);
temp = get_color_from_arduino(arduino);
color_matrix(8,4)=temp(2)-48;
take_color_and_draw(color_matrix(8,4),robot);

%_____________________________________________________________________________________________________________________________________________________

fprintf(robot, 'MVA T,%d',h3(1));
pause(0.3);
waitReceive(h3,robot);
temp = get_color_from_arduino(arduino);
color_matrix(8,3)=temp(2)-48;
take_color_and_draw(color_matrix(8,3),robot);

%_____________________________________________________________________________________________________________________________________________________

fprintf(robot, 'MVA T,%d',h2(1));
pause(0.3);
waitReceive(h2,robot);
temp = get_color_from_arduino(arduino);
color_matrix(8,2)=temp(2)-48;
take_color_and_draw(color_matrix(8,2),robot);

%_____________________________________________________________________________________________________________________________________________________

fprintf(robot, 'MVA T,%d',h1(1));
pause(0.3);
waitReceive(h1,robot);
temp = get_color_from_arduino(arduino);
color_matrix(8,1)=temp(2)-48;
take_color_and_draw(color_matrix(8,1),robot);

%_____________________________________________________________________________________________________________________________________________


fprintf(robot, 'MVA X,%d',i1(4));
pause(0.3);
waitReceive(i1,robot);
temp = get_color_from_arduino(arduino);
color_matrix(9,1)=temp(2)-48;
take_color_and_draw(color_matrix(9,1),robot);

%____________________________________________________________________________________________________________________________________________________

fprintf(robot, 'MVA T,%d',i2(1));
pause(0.3);
waitReceive(i2,robot);
temp = get_color_from_arduino(arduino);
color_matrix(9,2)=temp(2)-48;
take_color_and_draw(color_matrix(9,2),robot);

%_____________________________________________________________________________________________________________________________________________________

fprintf(robot, 'MVA T,%d',i3(1));
pause(0.3);
waitReceive(i3,robot);
temp = get_color_from_arduino(arduino);
color_matrix(9,3)=temp(2)-48;
take_color_and_draw(color_matrix(9,3),robot);

%_____________________________________________________________________________________________________________________________________________________

fprintf(robot, 'MVA T,%d',i4(1));
pause(0.3);
waitReceive(i4,robot);
temp = get_color_from_arduino(arduino);
color_matrix(9,4)=temp(2)-48;
take_color_and_draw(color_matrix(9,4),robot);

%_____________________________________________________________________________________________________________________________________________________

fprintf(robot, 'MVA T,%d',i5(1));
pause(0.3);
waitReceive(i5,robot);
temp = get_color_from_arduino(arduino);
color_matrix(9,5)=temp(2)-48;
take_color_and_draw(color_matrix(9,5),robot);

%_____________________________________________________________________________________________________________________________________________________

fprintf(robot, 'MVA T,%d',i6(1));
pause(0.3);
waitReceive(i6,robot);
temp = get_color_from_arduino(arduino);
color_matrix(9,6)=temp(2)-48;
take_color_and_draw(color_matrix(9,6),robot);

%_____________________________________________________________________________________________________________________________________________________

fprintf(robot, 'MVA T,%d',i7(1));
pause(0.3);
waitReceive(i7,robot);
temp = get_color_from_arduino(arduino);
color_matrix(9,7)=temp(2)-48;
take_color_and_draw(color_matrix(9,7),robot);

% have a loop for one dimension
% have another for loop for the other dimension
%check for the value in the array
% if green write a function to go to the home position
% if it is not green write a function to go the home position of the red



if ~isempty(instrfind)%if all serial port objects are NOT empty 
    fclose(instrfind);%Close all serial port objects
    delete(instrfind);%Delete all serial port objects
    clear s;
end

