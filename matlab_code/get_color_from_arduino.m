function color = get_color_from_arduino(arduino)
%% If a serial object is currently open, close it



%arduino = serial ('COM5', 'Baudrate', 9600); %% Declare serial object for communicating with arduino
%fopen(arduino); %Open serial port for arduino

%pause(2);
%set(arduino,'Terminator','CR');
fprintf(arduino,'1');
pause(1);
color =int8( fgets(arduino));

end

