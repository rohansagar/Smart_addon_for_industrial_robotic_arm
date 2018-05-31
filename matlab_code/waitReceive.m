%{
    waitReceive.m
    Author: Tim Mitchel
    This function is used to wait for the robot to execute certain tasks based on positional 
    feedback
    It constantly checks for the current position of the robot and if it is not the desired
    position it waits until it is.    

%}
function currentPosition = waitReceive(desiredPos,s)%Names of the axes

% USED IN CONJUNCTION WITH "BRL_STATIONS_01.m"
% The while loop is broken when the arm reaches the desired location (desiredPos input parameter)

% #For faster speeds but a more convoluted code, the serial object must be closed in this function, reopened in this function, closed again in this function, then
% then reopened in the script from which it was called every time this function is called. To do this: 
%             uncomment the "OPEN SECTION" BLOCK  AND THE "CLOSED SECTION"
% #For slower speeds and simpler code:
%               comment the "OPEN SECTION" BLOCK  AND THE "CLOSED SECTION"


% "IF STATEMENT 1" in the while loop accepts desiredPos array lengths up to five. Complex
% "IF STATEMENT 2" in the while loop accepts desiredPos array lengths of only five. Simple Ex.) desiredPos = [-4651,-1000,-1000,12807,0]

%% ################################################## OPEN SECTION ###########################################################################

% % Clear any open serial objects
% clear s
% if ~isempty(instrfind)
%     fclose(instrfind);
%     delete(instrfind);
% end
% 
% %% Open Serial port
% s = serial('COM6','BaudRate',9600);%Declare serial object
% fopen(s);%Open serial port

%% WAIT UNTIL POSITION IS REACHED LOOP 

L = length(desiredPos); %Use length to determine if statement
error = 10;%Allowable error in encoder count

while(1)         
    fprintf(s, 'RCP');%Read current position
    currentPosString = {fscanf(s)};%Read input buffer into a cell array 

    %CONVERT INPUT TO INTEGER
    lngth = cellfun('length', currentPosString);%Find the length of the raw reading
    last = lngth - 2;%The last digit of the raw reading is the third to last ascii character read
    posCell = {currentPosString{1}(2:last)};%Truncate raw reading. Remove first and last (> and ...)
    posChar = char(posCell);%Convert to character array
    currentPosition = str2num(posChar);

%##### IF STATEMENT 1 ################################################
%%%%%%%%%%THIS IF STATEMENT CAN BE USED IF THE LENGTH OF THE INPUT ARRAY (desiredPos) IS OF UNKNOWN LENGTH (MAX LENGTH = 5)
%%%%%%%%%%EX: desiredPos  = [-4651,-1000,-1000,12807,0];

    %CHECK CURRENT POSITION AGAINST DESIRED
    if (length(desiredPos) == length(currentPosition))        
        if (L == 1) && ...
            ((currentPosition(1) > (desiredPos(1)-error)) && (currentPosition(1) < (desiredPos(1)+error)))
            break
        elseif (L == 2) && ...
            (((currentPosition(1) > (desiredPos(1)-error)) && (currentPosition(1) < (desiredPos(1)+error))) && ...
            ((currentPosition(2) > (desiredPos(2)-error)) && (currentPosition(2) < (desiredPos(2)+error))))
            break
        elseif (L == 3) && ...
            (((currentPosition(1) > (desiredPos(1)-error)) && (currentPosition(1) < (desiredPos(1)+error))) && ...
            ((currentPosition(2) > (desiredPos(2)-error)) && (currentPosition(2) < (desiredPos(2)+error))) && ...
            ((currentPosition(3) > (desiredPos(3)-error)) && (currentPosition(3) < (desiredPos(3)+error))))
            break
        elseif (L == 4) && ... 
            (((currentPosition(1) > (desiredPos(1)-error)) && (currentPosition(1) < (desiredPos(1)+error))) && ...
            ((currentPosition(2) > (desiredPos(2)-error)) && (currentPosition(2) < (desiredPos(2)+error))) && ...
            ((currentPosition(3) > (desiredPos(3)-error)) && (currentPosition(3) < (desiredPos(3)+error))) && ...
            ((currentPosition(4) > (desiredPos(4)-error)) && (currentPosition(4) < (desiredPos(4)+error))))
            break
        elseif (L == 5) && ...
            (((currentPosition(1) > (desiredPos(1)-error)) && (currentPosition(1) < (desiredPos(1)+error))) && ...
            ((currentPosition(2) > (desiredPos(2)-error)) && (currentPosition(2) < (desiredPos(2)+error))) && ...  
            ((currentPosition(3) > (desiredPos(3)-error)) && (currentPosition(3) < (desiredPos(3)+error))) && ...
            ((currentPosition(4) > (desiredPos(4)-error)) && (currentPosition(4) < (desiredPos(4)+error))) && ...
            ((currentPosition(5) > (desiredPos(5)-error)) && (currentPosition(5) < (desiredPos(5)+error))))
            break
        end
    end    
    
    
    
%##### IF STATEMENT 2 ################################################   
%%%%%%%%%%THIS IF STATEMENT CAN BE USED INSTEAD OF THE ONE ABOVE IF THE SIZE OF THE INPUT ARRAY (desiredPos) IS KNOWN TO BE FIVE NUMBERS. 
%%%%%%%%%%EX: desiredPos  = [-4651,-1000];

%     %CHECK CURRENT POSITION AGAINST DESIRED
%     if (length(stationPos) == length(currentPosition)) && ...
%         (((currentPosition(1) > (stationPos(1)-error)) && (currentPosition(1) < (stationPos(1)+error))) && ...
%           ((currentPosition(2) > (stationPos(2)-error)) && (currentPosition(2) < (stationPos(2)+error))) && ...  
%           ((currentPosition(3) > (stationPos(3)-error)) && (currentPosition(3) < (stationPos(3)+error))) && ...
%           ((currentPosition(4) > (stationPos(4)-error)) && (currentPosition(4) < (stationPos(4)+error))) && ...
%           ((currentPosition(5) > (stationPos(5)-error)) && (currentPosition(5) < (stationPos(5)+error))))
%          break
%     else
%         fprintf(s, command);%IF NOT IN CORRECT POS RE-SEND MOVE COMMAND
%     end
end  


%% ################################################## CLOSE SECTION ###########################################################################

% clear s
% if ~isempty(instrfind)
%     fclose(instrfind);
%     delete(instrfind);
% end
   