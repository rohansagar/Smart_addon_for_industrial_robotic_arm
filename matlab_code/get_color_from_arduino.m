function color = get_color_from_arduino(arduino)
%% If a serial object is currently open, close it



%arduino = serial ('COM5', 'Baudrate', 9600); %% Declare serial object for communicating with arduino
%fopen(arduino); %Open serial port for arduino

%pause(2);
%set(arduino,'Terminator','CR');
pause(1.8);
fprintf(arduino,'1');
pause(1);
color =int8( fgets(arduino))


%{
while(1)
    color =int8( fgets(arduino));
    if(color(2)==48 | color(2)==49 | color(2)==50 | color(2)==51 | color(2)==52)
    break;

end

end
%}
