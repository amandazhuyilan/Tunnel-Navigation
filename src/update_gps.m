function [new_lat1 new_lon1] = update_gps(dist, heading, lat1, lon1)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    
    d = dist;
    R = 6371000;
    heading = degtorad(heading);
    lat1 = degtorad(lat1);
    lon1 = degtorad(lon1);
    mid1 = (sin(lat1)*cos(d/R) + (cos(lat1)*sin(d/R)*cos(heading)));
    new_lat1 = radtodeg(asin(mid1));
    new_lon1 = radtodeg(lon1 + atan2(sin(heading)*sin(d/R)*cos(lat1), cos(d/R)-sin(lat1)*sin(new_lat1)));
    %return [new_lat1 new_lon1];
    
end

