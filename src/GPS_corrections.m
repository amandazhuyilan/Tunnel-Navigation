% read in GPS data from LCM log
% assuming GPS matrix is called 'GPS'
GPS_corrected = [];
rows = length(GPS);
first_timestamp = GPS(1,1)
last_timestamp = convert_to_ten(first_timestamp, GPS(1,rows));
for c = first_timestamp:last_timestamp
    
    
find range of GPS times
make a matrix GPS_corrected
write for loop that iterates 1 time for each second that should be in the GPS log
if that time stamp is not available, add it to GPS_corrected as 'NaN'
    
function [seconds_since_first] = convert_to_ten(first_timestamp, timestamp)
    %uses wheel diameter 0.777m, C=2.441017m
    seconds_since_first = (rads/(2*pi))*2.441017;
end
