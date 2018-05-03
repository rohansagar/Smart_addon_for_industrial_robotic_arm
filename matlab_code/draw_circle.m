%{

	Code to draw a circle using the gencobot robot with an attachment that holds a pen.
	Author: Rohan Sagar
	Date: May 3- 2018
}%

if ~isempty(instrfind)%if all serial port objects are NOT empty 
    fclose(instrfind);%Close all serial port objects
    delete(instrfind);%Delete all serial port objects
    clear s;
end


robot = serial('COM4','BaudRate','9600'); % declare a serial object called robot connected to COM4 and at a baudrate of 9600 

fprintf(robot, 'SVN'); % swithch on the servos
pause(0.3); % wait for the motors to switch on 





fprintf(robot,'HOM'); % home the robot before you can do anything else
wait_receive(); % verify the co ordinbated and make sure that the homing is done 



%{	
 there are stations set form D to T thet is 17 stations that are situated all across the circumference of the circle.
 We move from one station to another so that a circle is drawn 
%}

% moving through the stations

fprintf(robot, 'MTP D');
wait_for_robot();
fprintf(robot, 'MTP E');
wait_for_robot();

fprintf(robot, 'MTP F');
wait_for_robot();

fprintf(robot, 'MTP D');
wait_for_robot();

fprintf(robot, 'MTP G');
wait_for_robot();

fprintf(robot, 'MTP H');
wait_for_robot();

fprintf(robot, 'MTP I');
wait_for_robot();

fprintf(robot, 'MTP J');
wait_for_robot();

fprintf(robot, 'MTP K');
wait_for_robot();

fprintf(robot, 'MTP L');
wait_for_robot();

fprintf(robot, 'MTP M');
wait_for_robot();

fprintf(robot, 'MTP N');
wait_for_robot();



fprintf(robot, 'SVF');
pause(0.5);



if ~isempty(instrfind)%if all serial port objects are NOT empty 
    fclose(instrfind);%Close all serial port objects
    delete(instrfind);%Delete all serial port objects
    clear s;
end



