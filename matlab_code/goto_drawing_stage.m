%{
goto_drawing_stage.m      
Author: Rohan Sagar 

This function is to go to the second stage where the arm with the sensor retracts and
the arm with the pen moves forward and the entire robot moves down to touch the paper
%}

function goto_drawing_stage(robot)
     
     
      fprintf(robot,'MVA R,2000'); 
      pause(5);
      fprintf(robot,'MVA R2,-7500');
      pause(6);
      fprintf(robot,'MVR Z,-3100');
      pause(5);


end