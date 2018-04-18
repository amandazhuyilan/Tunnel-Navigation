% Jake Messner
% Uses GPS data to calculate tunnel entrance and exit speeds for input to
% dead reckoning algorithm
    % 145 seconds in tunnel
clear all
format long;
GPS = [];
    %filepath to your csv GPS dataset with tunnel data
GPS1 = csvread('../Data/04-11-2018/CSV/GPS_Chinatown_HomeDepot.csv', 1, 0);
GPS = csvread('../Data/04-11-2018/CSV/GPS_HomeDepo_Chinatown.csv', 1, 0);
%GPS = [GPS1; GPS2];
test = GPS(3,3);
last = 0;
speed_tracker = [];
%speed_tracker(1,1) = 'In or Out';
%speed_tracker(1,2) = 'Timestamp';
%speed_tracker(1,3) = 'Speed(m/s)';
log_num = 1;
inorout = 0; %0 denotes traveling into tunnel, 1 is travelling out
for c = 1:size(GPS,1)
    current = GPS(c,2);
    if (isnan(current) == 1) & (isnan(last) == 0)
        inorout = 0;
        speed = calcSpeed(GPS(c-2,2), GPS(c-1,2), GPS(c-2,3), GPS(c-1,3));
        speed_tracker(log_num,1) = 0;
        speed_tracker(log_num,2) = GPS(c-1,1);
        speed_tracker(log_num,3) = speed;
        log_num = log_num + 1;
    elseif (isnan(last) == 1) & (isnan(current) == 0)
        inorout = 1;
        speed = calcSpeed(GPS(c,2), GPS(c+1,2), GPS(c,3), GPS(c+1,3));
        speed_tracker(log_num,1) = 1;
        speed_tracker(log_num,2) = GPS(c,1);
        speed_tracker(log_num,3) = speed;
        log_num = log_num + 1;
        %log speed to dataset 
    end
    %Check if row is NaN or a number, stop if last is different from current
    %store if NaN or a number came first 
    last = current;
end

% animate(GPS);

function [speed] = calcSpeed(lat1,lat2, lon1, lon2)
    lon1 = -1*lon1;
    lon2 = -1*lon2;
    lat1_adj = (((lat1/100) - floor(lat1/100))*10000)/6000 + floor(lat1/100);
    lat2_adj = (((lat2/100) - floor(lat2/100))*10000)/6000 + floor(lat2/100);
    lon1_adj = (((lon1/100) - floor(lon1/100))*10000)/6000 + floor(lon1/100);
    lon2_adj = (((lon2/100) - floor(lon2/100))*10000)/6000 + floor(lon2/100);
    %Length of 1 degree of Longitude = cosine (latitude in decimal degrees) * length of degree (miles) at equator.
    lon_length_m = cos(lat2_adj) * 69.172 *1609.34;
    lat_m = ((abs(lat1_adj - lat2_adj))) * 111045;
    lon_m = ((abs(lon1_adj - lon2_adj))) * lon_length_m;
    speed = sqrt(lat_m^2 + lon_m^2);
    %Given 2 GPS coordinate sets traversed in 1 second, calculate average speed

end

function animate(GPS)
figure
ref_points = [4224 -7105; 4220 -7103]
GPS_plotter = [];
    for k = 1:length(GPS)
        GPS_plotter = [GPS_plotter; GPS(k,:)];
        %plot(ref_points(:,1), ref_points(:,2))
        plot(GPS_plotter(:,3), GPS_plotter(:,2))
        drawnow
        hold on
    end
end
