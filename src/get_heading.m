function [heading] = get_heading(lat1, lat2, lon1, lon2)
%given 2 pairs of GPS coordinates, calculates heading
%   Used to find tunnel entrance heading for starting point for position
%   estimation
    lon1 = -1*lon1;
    lon2 = -1*lon2;
    lat1_adj = (((lat1/100) - floor(lat1/100))*10000)/6000 + floor(lat1/100);
    lat2_adj = (((lat2/100) - floor(lat2/100))*10000)/6000 + floor(lat2/100);
    lon1_adj = (((lon1/100) - floor(lon1/100))*10000)/6000 + floor(lon1/100);
    lon2_adj = (((lon2/100) - floor(lon2/100))*10000)/6000 + floor(lon2/100);
    lon1_adj = lon1_adj*-1;
    lon2_adj = lon2_adj*-1;
    var_y = sin(lon2_adj-lon1_adj)*cos(lat2_adj);
    var_x = (cos(lat1_adj)*sin(lat2_adj)) - (sin(lat1_adj) * cos(lat2_adj)*cos(lon2_adj-lon1_adj));
    heading = atan2(var_y, var_x);
end

