%{
 this finction is to go to the second stage where the arm with the sensor retracts and
 the arm with the pen moves forward and the entire robot moves down to touch the paper
%}

function goto_drawing_stage(robot)
    
      fprintf(robot,'MTP B');
      pause(3);

end