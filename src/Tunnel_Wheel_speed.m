%Read Wheel speed and GPS speed from CSV data
wheel_speed= readtable('CAR_wheel_speed.csv');
gps_data= readtable('LCM_GPS.csv');

%Avg Wheel speed
wheel_speed.AvgSpeed=(wheel_speed.frontLeft+wheel_speed.frontRight...
+wheel_speed.rearLeft+wheel_speed.rearRight)/4;

%To simplify timer
wheel_speed.NewTime= wheel_speed.Time-1523042091;

 
%Tunnel 1: Entrance Timestamp: 191851(241s),  Exit Timestamp: 193421(1171s)
%Tunnel 2: Entrance Timestamp: 193451(1201s), Exit Timestamp: 193601(1271s)
%Tunnel 3: Entrance Timestamp: 193649(1319s), Exit Timestamp: 193734(1364s)
%Tunnel 4: Entrance Timestamp: 194222(1652s), Exit Timestamp: 194224(1654s)
%Tunnel 5: Entrance Timestamp: 194921(2071s), Exit Timestamp: 195048(2158s)

%Calculating Car Entrance speed in Tunnel 
%(Avg of 100 readings during that second)

ent_speed1= mean(wheel_speed.AvgSpeed(24070:24169));
ent_speed2= mean(wheel_speed.AvgSpeed(119754:119853));
ent_speed3= mean(wheel_speed.AvgSpeed(131554:131653));
ent_speed4= mean(wheel_speed.AvgSpeed(164854:164953));
ent_speed5= mean(wheel_speed.AvgSpeed(206755:206854));
entrance_speed= [ent_speed1, ent_speed2, ent_speed3, ent_speed4, ent_speed5]';

%Calculating Car Exit speed from Tunnel
%(Avg of 100 readings during that second)

exit_speed1= mean(wheel_speed.AvgSpeed(116754:116853));
exit_speed2= mean(wheel_speed.AvgSpeed(126754:126853));
exit_speed3= mean(wheel_speed.AvgSpeed(136054:136153));
exit_speed4= mean(wheel_speed.AvgSpeed(165054:165153));
exit_speed5= mean(wheel_speed.AvgSpeed(215455:215554));
exit_speed= [exit_speed1, exit_speed2, exit_speed3, exit_speed4, exit_speed5]';

%Convert rad/s to m/s
circumference=2.0748625;
entrance_speed_1=(entrance_speed/(2*pi))*circumference;
exit_speed_1= (exit_speed/(2*pi))*circumference;


%GPS ENTRANCE AND EXIT SPEED
gps_entrance_speed=[13.9967,6.5528,3.3348,10.6221,0.6494]';
gps_exit_speed=[0.9151,7.6034,6.6964,7.7345,19.3831]';

%Table
speed=table(entrance_speed,exit_speed,entrance_speed_1,exit_speed_1,gps_entrance_speed,gps_exit_speed)
speed.Properties.VariableNames={'Entrance_Speed_rad_s','Exit_Speed_rad_s','Entrance_speed_m_s','Exit_Speed_m_s','GPS_Entrance_Speed_m_s','GPS_Exit_Speed_m_s'};
speed