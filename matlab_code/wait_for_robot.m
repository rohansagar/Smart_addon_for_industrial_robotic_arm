%{
wait_for_robot.m
Author: Rohan Sagar    
This function is used to wait for the robot to complete execution of a task.
The gencobot has a feature of letting us know if it is busy.
To check if the robot is busy, we need to give it a command "STA" which returns a code 
Based on the code we decide if he robot is busy, and if it is busy we wait until the robot is not
busy anymore.
%}

function result = wait_for_robot(robot) % this function takes serial object of the robot

    %% this function waits until the robot status is ok
    %% it checks for the status and if the status is not 0048 it stays in a loop until it arrives
    temp = {fscanf(robot)}; % store the value from the serial port into temp
    ok = 0048; % defining the ok stauts code
    hom_ok = 0040;

    fprintf(robot,'STA'); % sending the command to get status

    while(1)
        fprintf(robot,'STA'); % sending the command to get status
        pause(0.2);
        temp = {fscanf(robot)};
        %CONVERT INPUT TO INTEGER
        lngth = cellfun('length', temp);%Find the length of the raw reading
        last = lngth - 2;%The last digit of the raw reading is the third to last ascii character read
        temp_2 = {temp{1}(2:last)};%Truncate raw reading. Remove first and last (> and ...)
        temp_char = char(temp_2);%Convert to character array
        status = str2num(temp_char);
        if ((status == ok)|(status == hom_ok))
            result = status;
            break;
        end
    
        status = 0;
    end