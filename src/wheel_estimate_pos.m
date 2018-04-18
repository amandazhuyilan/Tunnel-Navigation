% Jake Messner
% Using encoder data from all 4 wheels, estimate position underground with
% curves
%given starting heading and 4 independend wheel speeds, calculate heading
%and distance traveled 
% wheel speed read at 100Hz

clear all
close all
format long;
WS = [];
    %filepath to your csv GPS dataset with tunnel data
    
WS = csvread('../Data/04-11-2018/CSV/CAR_wheel_speed_HomeDepot_Chinatown.csv', 1, 0);
%GPS1 = csvread('../Data/04-11-2018/CSV/GPS_Chinatown_HomeDepot.csv', 1, 0);
GPS = csvread('../Data/04-11-2018/CSV/GPS_HomeDepo_Chinatown.csv', 1, 0);
%GPS = [GPS1; GPS2];
for c = 2:length(GPS)
    new_timestamp = convert_to_ten(GPS(1,1), GPS(c,1));
    GPS(c,1) = new_timestamp;
end

for c = 1: length(GPS)
    lat1 = GPS(c,2);
    lon1 = GPS(c,3);
   lon1 = lon1*-1;
   lat1 = (((lat1/100) - floor(lat1/100))*10000)/6000 + floor(lat1/100);
   lon1 = (((lon1/100) - floor(lon1/100))*10000)/6000 + floor(lon1/100);
   lon1 = lon1*-1; 
   GPS(c,2) = lat1;
   GPS(c,3) = lon1;
end
GPS(1,1) = 0;
%IMU1 = csvread('../Data/04-11-2018/CSV/IMU_Chinatown_HomeDepot.csv', 1, 0));
%IMU2 = csvread('../Data/04-11-2018/CSV/IMU_HomeDepot_Chinatown.csv', 1 , 0);
%IMU = [IMU1; IMU2];
    % matrix is of format Time,front left,front right,rear left,rear right
test = WS(3,3);
track = 1.65; %meters

    %filepath to your csv GPS dataset with tunnel data
est_GPS = [];
%GPS = csvread('../Data/04-11-2018/LCM_GPS.csv', 1, 0);
wheel_time1 = 0;
wheel_time2 = 0;
last = 0;
est_heading = 0;
local_ws = [];
update_count = 0;
%speed_tracker(1,3) = 'Speed(m/s)';
for c = 1:size(GPS,1)
    current = GPS(c,2);
    if (isnan(current) == 1) & (isnan(last) == 0) % going into tunnel
        %find this spot in wheel data
        heading = get_heading(GPS(c-2,2), GPS(c-1,2), GPS(c-2,3), GPS(c-1,3));
        heading = 115;
            % function still needs to be finished
        wheel_time1 = c*100; %get time stamp for wheel speed
        lat1 = GPS(c-1,2); %get starting coordinates
        lon1 = GPS(c-1,3);
        est_GPS = [est_GPS; GPS(c,1) GPS(c,2) GPS(c,3)];
    elseif (isnan(current) == 1) % currently driving in tunnel
        for c=0:3
        % find this spot in wheel data A(5:7,:)
        ws_timestamp = (GPS(c,1)-GPS(1,1))*100+(c*25);
        local_ws = WS(ws_timestamp:ws_timestamp+25,:); %(d1/d2 = v1/v2)
        avg_lf = mean(local_ws(:,1));
        avg_rf = mean(local_ws(:,2));
        dist_lw = avg_lf*0.33022;
        dist_rw = avg_rf*0.33022;
        radius = 0.5*((3.3*dist_lw)/(dist_rw - dist_lw));
        dist_went = (dist_lw + dist_rw)/2;
        %[lat1 lon1] = update_gps(19, -3, 42.32, -71.03);
        %dummy =1
        [lat1 lon1] = update_gps(dist_went*2, heading, lat1, lon1);
        est_GPS = [est_GPS; GPS(c,1) lat1 lon1];
        heading = heading + (((dist_went/radius)*360)/4)*-1;
        update_count = update_count + 1;
        % in 1 second blocks, calculate distance by left and right wheel
        % update heading estimate
        % average the 4 wheel distance and add that in the heading estimate
        end
    else
        est_GPS = [est_GPS; GPS(c,1) GPS(c,2) GPS(c,3)];
    end
    %Check if row is NaN or a number, stop if last is different from current
    %store if NaN or a number came first 
    last = current;
end

figure;
plot(GPS(:,3), GPS(:,2))
hold on
grid on
title('Position Tracking from Wheel Speed Algorithm')
xlabel('Longitude')
ylabel('Latitude')
pause(3);
plot(est_GPS(545:615,3), est_GPS(545:615,2))

function [speed] = add_to_trajectory(WS, lat1, lat2, lon1, lon2, wheel_time1, wheel_time2, heading)
    lat1_adj = (((lat1/100) - floor(lat1/100))*10000)/6000 + floor(lat1/100);
    lat2_adj = (((lat2/100) - floor(lat2/100))*10000)/6000 + floor(lat2/100);
    lon1_adj = (((lon1/100) - floor(lon1/100))*10000)/6000 + floor(lon1/100);
    lon2_adj = (((lon2/100) - floor(lon2/100))*10000)/6000 + floor(lon2/100);
    %Length of 1 degree of Longitude = cosine (latitude in decimal degrees) * length of degree (miles) at equator.
    for j = wheel_time1:wheel_time2
        WS_FL = rads_ms(WS(j,2));
        WS_FR = rads_ms(WS(j,3));
    end
    speed = 10;
    %Given 2 GPS coordinate sets traversed in 1 second, calculate average speed
    plot(GPS(:,2), GPS(:,3))
    plot(est_GPS(:,2), est_GPS(:,3))
end

function [ms] = rads_ms(rads)
    %uses wheel diameter 0.777m, C=2.441017m
    ms = rads*0.33022;
end

