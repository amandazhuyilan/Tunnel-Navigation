%By Shaoshuang Jian (Susie).
%Part1- 
%Deal with magnetometer, remove hard iron,soft iron effects.
%Implement complementary filter
%Part2-
%Adjust velocity and heading of data when in the tunnel
%Estimate gps in tunnel
%% Manipulate magnetometer/gyro/yaw to obtain heading
%% plot first turns for calibration
calib=3710:7785;
selectmagx=mag_x(calib); %only use 2-3rounds
selectmagy=mag_y(calib);
%plot(selectmagy) to check noise
selectmagy(2044)=selectmagy(2043);
selectmagy(2045)=selectmagy(2043);
selectmagy(381)=selectmagy(385);
selectmagy(380)=selectmagy(385);

%% update mag_x,mag_y(eliminate hard-iron effect)
a=mean(selectmagx);%current center of ellipse
b=mean(selectmagy);

% [~,colsize]=size(selectmagx);
% select_xx=selectmagx-repmat(a,1,colsize);
% select_yy=selectmagy-repmat(b,1,colsize);
figure(1);
scatter(select_xx,select_yy,'+');
title('magnetometer readings after hard iron');
figure(2);
scatter(selectmagx,selectmagy,'+');
title('magnetometer readings before hard iron');
axis equal;
%correction to all mag data......UPDATED MAG_X, MAG_Y
mag_x=mag_x-repmat(a,1,m-1);
mag_y=mag_y-repmat(b,1,m-1);

oldmagx=mag_x-repmat(a,1,m-1);
oldmagy=mag_y-repmat(a,1,m-1);


%% correct soft-iron effect(fit an ellipse) and get yaw for all mag data
% 1.Fit allellipse to -0.0128 IGNORED! get phi, then rotate to get allellipsefix
allellipse=fit_ellipse(mag_x,mag_y);

% 2.correct allellipsefix to circle-allellipsefixult
A=allellipse.a;
B=allellipse.b;
ra=0.25;%self-regulated radius,set a similar value?

for j=1:1:(m-1)
  ultmagX(j) = ra*mag_x(j)/A;
  ultmagY(j) = ra*mag_y(j)/B;
end
%check corrected circle
% figure(4);
% scatter(oldmagx,oldmagy,'.');
% title('Total magnetometer readings');
% 
% allellipsefixult=fit_ellipse(ultmagX,ultmagY);
% 
% figure(5);
% scatter(ultmagX,ultmagY,'.');
% title('Total magnetometer readings after calibration'); 
% axis equal;

%% plot yaw from  mag measurement & put into low pass filter
for zz=1:1:(m-1)
   magyaw(zz)=(atan2(-ultmagY(zz),ultmagX(zz)))*180/pi;%note must use atan2 beause atan only return -90~90 deg
end

%put mag yaw to low-pass filter
nn=1;
Wn=0.02;
ftype='low';
[bb,aa] = butter(nn,Wn,ftype);
dataIn = magyaw;
magyawOut = filter(bb,aa,dataIn);

%% get yaw integrated from gyro-z(yawangle is from gyro)
angle = cumtrapz(timeseries,gyro_z);
yawangle(:) = angle(:)*180/pi;
initialMagYaw = mean(magyaw(1:2000));
yawangle = yawangle + repmat(initialMagYaw,1,m-1);
yawangle = wrapTo180(yawangle);

%put gyro-z yaw to high-pass filter
nnn=1;
Wnn=0.02;
ftypee='high';
[bbb,aaa] = butter(nnn,Wnn,ftypee);
dataInn = yawangle;
gyroyawOut = filter(bbb,aaa,dataInn);

%% complementary filter
alpha=0.98;
yawOut=alpha*(magyawOut)+(1-alpha)*(gyroyawOut);
%yawOut=yawOut+repmat(50,1,20644);
yawOut=wrapTo180(yawOut);%limit to -180~180

% compare
figure(6);
subplot(2,2,1);
plot(magyaw);
title('Yaw calculated from Mag');
xlabel('timeseries(s/40)');
ylabel('Yaw Angle(degree)');

subplot(2,2,2);
plot(magyawOut);
title('low-pass filtered Yaw calculated from Mag');
xlabel('timeseries(s/40)');
ylabel('Yaw Angle(degree)');

subplot(2,2,4);
plot(yaw);
title('Yaw angle from IMU');
xlabel('timeseries(s/40)');
ylabel('Yaw Angle(degree)');

subplot(2,2,3);
plot(yawOut);
title('Yaw after complementary filter from gyro-z and mag');
xlabel('timeseries(s/40)');
ylabel('Yaw Angle(degree)');


%% Apply yaw and accelerometer to estimate route
%% integrate accel-x to obtain velocity
%integrate accel
%eliminate accumulated g when stopping
meanave=mean(accel_x(1:1000));
acc_x=accel_x-repmat(meanave,1,m-1);

acc_select=acc_x(21800:24800);
time_select=timeseries(21800:24800);

v_select=cumtrapz(time_select,acc_select);
v0=22.339;
% used following selected and adjusted v to estimate route
vfix_select=v_select+repmat(v0,1,3001);

figure(19);
plot(v_select);
hold on;
plot(vfix_select);
hold off;
title('v_x vs time');
xlabel('time(s)'); % x-axis label
ylabel('v_x(m/s)'); % y-axis label
grid on;

%% find initial heading (140 degree)
pha1=42.364489999*pi/180;
lamb1=-71.058695*pi/180;
pha2=42.3643783*pi/180; %t=545s, last point before entering tunnel
lamb2=-71.0585683*pi/180;

deltal=lamb2-lamb1;

theta=atan2(sin(deltal)*cos(pha2),cos(pha1)*sin(pha2)-sin(pha1)*cos(pha2)*cos(deltal));
theta_deg=theta*180/pi;

%% select the data when in the tunnel & adjust yaw with initial heading
range=21800:24800;
size=max(range)-min(range)+1;
yaw_select=yaw(range);
%initial angle difference between gps and IMU 
diff=yaw_select(1)-theta_deg;
yawadjust_select=wrapTo180(yaw_select-repmat(diff,1,size));

%check the difference in yaw
figure(100);
plot(yaw_select);
hold on ;
plot(yawadjust_select);
hold off;

%% calculate lat,lon of each point according to yaw,last lat,lon
R=6371000; %earth radius
t=0.025; %time interval
%distance of each step
d=vfix_select*t;
ad=d/R;
pha=zeros(1,size);
lamb=zeros(1,size);
pha(1)=pha2;
lamb(1)=lamb2;
% turn heading in degree to that in rad
yawrad=yawadjust_select*pi/180;

%calculate/update missing lat/lon
for y=2:1:size
    pha(y)=asin(sin(pha(y-1))*cos(ad(y-1))+cos(pha(y-1))*sin(ad(y-1))*cos(yawrad(y-1)));
    lamb(y)=lamb(y-1)+atan2(sin(yawrad(y-1))*sin(ad(y-1))*cos(pha(y-1)),cos(ad(y-1))-sin(pha(y-1))*sin(pha(y)));
end

% convert radian angle to deg lat,lon
pha_lat=pha*180/pi;
lamb_lon=lamb*180/pi;

figure(99);
plot(lon_deg,lat_deg);
hold on;
plot(lamb_lon,pha_lat);
hold off;
title('Position Tracking with IMU yaw and accelerometer');
legend('gps measurement','estimated route');
xlabel('longitude');
ylabel('latitude');
grid on;

% write the estimated lat,lon into 'estimated_gps.csv'
newlat=transpose(pha_lat);
newlon=transpose(lamb_lon);
gps=[newlat newlon];
format long;
dlmwrite('estimated_gps.csv',gps,'precision','%8.10f');


