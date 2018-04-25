function result = wait_for_robot(robot)
%% this function waits until the robot status is ok
%% it checks for the status and if the status is not 0048 it stays ina loop until it arrives


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