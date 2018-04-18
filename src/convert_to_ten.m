function [seconds_since_first] = diff_calculator(first_timestamp, timestamp)  % 160412, 160620 returns 128
    hours1 = floor(first_timestamp/10000);
    mins1 = floor(((first_timestamp/10000)-hours1)*100);
    secs1 = round(((((first_timestamp/10000)-hours1)*100) - mins1)*100);
    hours2 = floor(timestamp/10000);
    mins2 = floor(((timestamp/10000)-hours2)*100);
    secs2 = round(((((timestamp/10000)-hours2)*100) - mins2)*100);
    seconds_since_first = ((hours2-hours1)*3600) + ((mins2-mins1)*60) + (secs2-secs1);
end