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
fopen(robot);%Open serial port for gencobot
pause(2); % wait for 2 seconds

fprintf(robot, 'SVN');
pause(5);
fprintf(robot, 'MTP V');
pause(5);
fprintf(robot, 'MTP W');
pause(5);
fprintf(robot, 'MTP X');
pause(5);
fprintf(robot, 'MTP Y');
pause(5);
fprintf(robot, 'MTP Z');
pause(5);
fprintf(robot, 'MTP W');
pause(5);
fprintf(robot, 'MTP V');

if ~isempty(instrfind)%if all serial port objects are NOT empty 
    fclose(instrfind);%Close all serial port objects
    delete(instrfind);%Delete all serial port objects
    clear s;
end


