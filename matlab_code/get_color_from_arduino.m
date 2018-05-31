%{
    get_color_from_arduino.m
    Author: Rohan Sagar
    This is the function that takes the arduino serial object to receive the data from arduino
    and returns.     
%}


function color = get_color_from_arduino(arduino)
fprintf(arduino,'1'); % This is a signal to the arduino to detect the color and send it to the computer
pause(2);% delay to allow the arduin to respond
color =int8(fgets(arduino)); % return the color

