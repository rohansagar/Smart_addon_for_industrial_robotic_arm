function take_color_and_draw(a,robot)

 % this function takes the color as an imput and then draws to the required destiniation


	if( a == 1)% If red color is detected
   
	    % set the current location as a station so that we can come back to it after drawing when we want to resume scanning 
	    fprintf(robot, 'NTC a');% this command is used to start teaching a station named 'a'
	    pause(1);
	    fprintf(robot, 'ENT 1'); % a part of teaching routine
	    pause(1);
	    fprintf(robot, 'SAV'); % save the station to not volatile memory
	    pause(1); 
		% move up to avoid clearance issues 
	    fprintf(robot, 'MVR Z,1000');
	    wait_for_robot(robot); 

        % this function gets the robot into a position from which it can draw
	    goto_drawing_stage(robot);
		% change this if you want to match the red squares to any location other than 4
	    fprintf(robot,'MTP B'); % this is the station that allows us to go to 4 since we have to match the square with red to 4
	    pause(6);

	    fprintf(robot, 'MVR Z,2000');% this is to lift up the pen so that the robot is not drawing anymore
	    pause(6);
	    fprintf(robot,'MTP a'); % go to the station that we saved before so that we can resume scanning from there
	    pause(6);

	end

	if ( a ==2) % if green color is detected
    
		% set the current location as a station so that we can come back to it after drawing when we want to resume scanning 
		fprintf(robot, 'NTC a');% this command is used to start teaching a station named 'a'
		pause(1);
		fprintf(robot, 'ENT 1'); % a part of teaching routine
		pause(1);
		fprintf(robot, 'SAV'); % save the station to not volatile memory
		pause(1); 
		% move up to avoid clearance issues 
		fprintf(robot, 'MVR Z,1000');
		wait_for_robot(robot); 
		% this function gets the robot into a position from which it can draw
		goto_drawing_stage(robot);

		% change this if you want to match the green squares to any location other than E
		fprintf(robot,'MTP b'); % this is the station that allows us to go to E since we have to match the square with green to E
		pause(6);

		fprintf(robot, 'MVR Z,2000');% this is to lift up the pen so that the robot is not drawing anymore
		pause(6);
		fprintf(robot,'MTP a'); % go to the station that we saved before so that we can resume scanning from there
		pause(6);
	end

end
