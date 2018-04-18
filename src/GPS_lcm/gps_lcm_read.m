clear all
clear java
% add the lcm.jar file to the matlabpath - need to only do this once
javaaddpath '/home/amanda/Tunnel-Navigation/Tunnel-Navigation-Project/GPS_lcm/GPS_struct_type.jar'
javaaddpath '/usr/local/share/java/lcm.jar'

% Let’s assume the logging file is lcm-l.02 in the dir below
% open log file for reading

log_file = lcm.logging.Log('/home/amanda/Tunnel-Navigation/Tunnel-Navigation-Project/GPS_lcm/log/GPS-lcm-log-2018-04-06-15:14:50', 'r'); 

LCM_GPS = [];
while true
    try
        ev = log_file.readNext();
        % channel name is in ev.channel
        % there may be multiple channels but in this case you are only interested in RDI channel
        if strcmp(ev.channel, 'GPS')
 
        % build rdi object from data in this record
            msg_gps = gps_lcm.gps_t(ev.data);

        % now you can do things like d epending upon the rdi_t struct that was defined
            format long;
            time = str2double(msg_gps.time);
	    lon = str2double(msg_gps.lon);
            lat = str2double(msg_gps.lat);
            LCM_GPS = [LCM_GPS; time lon lat];
        end
    catch err   % exception will be thrown when you hit end of file
        break;
    end
end

figure 
plot(LCM_GPS(:,1), LCM_GPS(:,2), '*');
title("GPS data through two tunnels")
xlabel("Longtitude")
ylabel("Latitude")




