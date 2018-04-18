% GPSHomeDepoChinatown = table2array(GPSHomeDepoChinatown);

plot_lat = zeros(size(GPSHomeDepoChinatown));
plot_long = zeros(size(GPSHomeDepoChinatown));

for n=1:1:size(GPSHomeDepoChinatown)
    lat1 = GPSHomeDepoChinatown(n,1);
    lon1 = GPSHomeDepoChinatown(n,2);
    
    lon1 = lon1*-1;
    lat1 = (((lat1/100) - floor(lat1/100))*10000)/6000 + floor(lat1/100);
    lon1 = (((lon1/100) - floor(lon1/100))*10000)/6000 + floor(lon1/100);
    lon1 = lon1*-1;
    
    plot_lat(n) = lat1;
    plot_long(n) = lon1;
end

plot_gps = [plot_lat(:,1) plot_long(:,1)];

dlmwrite('our_gps.csv', plot_gps, 'precision', '%8.8f')
