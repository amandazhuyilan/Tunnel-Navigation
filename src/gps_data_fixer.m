% read in GPS data from LCM log
% assuming GPS matrix is called 'GPS'
GPS_corrected = [];
rows = length(GPS);
first_timestamp = GPS(1,1);
last_timestamp = diff_calculator(first_timestamp, GPS(rows,1));
last_time = first_timestamp - 1;
for c = 1:rows
   this_time = convert_to_ten(first_timestamp, GPS(c,1));
   %if last row is 1 before this row, log it to GPS_corrected
   %else add the difference in rows to GPS_corrected as NaN
   if last_time == this_time - 1
       % go ahead and log to GPS_corrected
       to_add = [(GPS(c,1)) (GPS(c,2)) (GPS(c,3))];
       GPS_corrected = [GPS_corrected; to_add];
   else
       time_in_tunnel = this_time - last_time;
       for k = 1:time_in_tunnel
           to_add = [last_time+k NaN NaN];
           GPS_corrected = [GPS_corrected; to_add];
       end
   end
   last_time = this_time;
end
