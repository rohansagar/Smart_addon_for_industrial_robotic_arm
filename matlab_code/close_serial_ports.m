%{
    close_serial_ports.m
    Author: Rohan Sagar
    Date: May-3-2018
    This code closes all the open serial ports. 
    It is intended to be used before and after every program so that the ports open correctly
    and are closed after they are used.
%}
function close_serial_ports()

    if ~isempty(instrfind)%if all serial port objects are NOT empty 
        fclose(instrfind);%Close all serial port objects
        delete(instrfind);%Delete all serial port objects
        clear s;
    end
    
     