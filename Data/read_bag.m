addpath('/home/amanda/Tunnel-Navigation/Tunnel-Navigation-Project/Data/NEUFR-agv-ws/src/matlab_gen/msggen')
savepath
%Read in rosbag files
bag1 = rosbag('2018-03-29-13-51-38.bag');
% bag2 = rosbag('2018-03-29-14-57-36.bag');

%Filter Rosbags by topic name
gps_fix = select(bag1, 'Topic','/vehicle/gps/fix');
gps_time = select(bag1, 'Topic', '/vehicle/gps/time');
gps_vel = select(bag1, 'Topic', '/vehicle/gps/vel');
imu_raw = select(bag1, 'Topic', '/vehicle/imu/data_raw');
wheel_speed = select(bag1, 'Topic', '/vehicle/wheel_speed_report');

%Return all messages as cell array
msg_gps_fix = readMessages(gps_fix);
msg_gps_vel = readMessages(gps_vel);
msg_imu_raw = readMessages(imu_raw);
msg_wheel_speed = readMessages(wheel_speed);

% %% Convert Cell Arrays
% 
% %ClosedStationary
% utmx_ClosedStationary = zeros(size(msg_gps_fix));
% utmy_ClosedStationary = zeros(size(msg_gps_fix));
% utmz_ClosedStationary = zeros(size(msg_gps_fix));
% 
% for n=1:1:size(msg_gps_fix)
%    temp = msg_gps_fix(n);
%    temp2 = temp{1,1};
%    utmx_ClosedStationary(n) = temp2.Pose.Pose.Position.X;
%    utmy_ClosedStationary(n) = temp2.Pose.Pose.Position.Y;
%    utmz_ClosedStationary(n) = temp2.Pose.Pose.Position.Z;
% end
% 
% %ClosedWalk
% utmx_ClosedWalk = zeros(size(msg_gps_vel));
% utmy_ClosedWalk = zeros(size(msg_gps_vel));
% utmz_ClosedWalk = zeros(size(msg_gps_vel));
% 
% for n=1:1:size(msg_gps_vel)
%    temp = msg_gps_vel(n);
%    temp2 = temp{1,1};
%    utmx_ClosedWalk(n) = temp2.Pose.Pose.Position.X;
%    utmy_ClosedWalk(n) = temp2.Pose.Pose.Position.Y;
%    utmz_ClosedWalk(n) = temp2.Pose.Pose.Position.Z;
% end
% 
% %OpenStationary
% utmx_OpenStationary = zeros(size(msg_imu_raw));
% utmy_OpenStationary = zeros(size(msg_imu_raw));
% utmz_OpenStationary = zeros(size(msg_imu_raw));
% 
% for n=1:1:size(msg_imu_raw)
%    temp = msg_imu_raw(n);
%    temp2 = temp{1,1};
%    utmx_OpenStationary(n) = temp2.Pose.Pose.Position.X;
%    utmy_OpenStationary(n) = temp2.Pose.Pose.Position.Y;
%    utmz_OpenStationary(n) = temp2.Pose.Pose.Position.Z;
% end
% 
% %OpenWalk
% utmx_OpenWalk = zeros(size(msg_wheel_speed));
% utmy_OpenWalk = zeros(size(msg_wheel_speed));
% utmz_OpenWalk = zeros(size(msg_wheel_speed));
% 
% for n=1:1:size(msg_wheel_speed)
%    temp = msg_wheel_speed(n);
%    temp2 = temp{1,1};
%    utmx_OpenWalk(n) = temp2.Pose.Pose.Position.X;
%    utmy_OpenWalk(n) = temp2.Pose.Pose.Position.Y;
%    utmz_OpenWalk(n) = temp2.Pose.Pose.Position.Z;
% end

%{
%Create all rosbags as timeseries
ts_utm_ClosedStationary = timeseries(utmClosedStationary, 'Pose.Pose.Position.X', 'Pose.Pose.Position.Y', 'Pose.Pose.Position.Z');
ts_utm_ClosedWalk = timeseries(utmClosedWalk, 'Pose.Pose.Position.X', 'Pose.Pose.Position.Y', 'Pose.Pose.Position.Z');
ts_utm_OpenStationary = timeseries(utmOpenStationary, 'Pose.Pose.Position.X', 'Pose.Pose.Position.Y', 'Pose.Pose.Position.Z');
ts_utm_OpenWalk = timeseries(utmOpenWalk, 'Pose.Pose.Position.X', 'Pose.Pose.Position.Y', 'Pose.Pose.Position.Z');

ts_rtk_OpenWalk = timeseries(rtkOpenWalk, 'Latitude', 'Longitude', 'Altitude');
%}
% 
% %% Normalize utm data
% utmx_ClosedStationary=utmx_ClosedStationary-utmx_ClosedStationary(1);
% utmy_ClosedStationary=utmy_ClosedStationary-utmy_ClosedStationary(1);
% utmz_ClosedStationary=utmz_ClosedStationary-utmz_ClosedStationary(1);
% utmx_ClosedWalk=utmx_ClosedWalk-utmx_ClosedWalk(1);
% utmy_ClosedWalk=utmy_ClosedWalk-utmy_ClosedWalk(1);
% utmz_ClosedWalk=utmz_ClosedWalk-utmz_ClosedWalk(1);
% utmx_OpenStationary=utmx_OpenStationary-utmx_OpenStationary(1);
% utmy_OpenStationary=utmy_OpenStationary-utmy_OpenStationary(1);
% utmz_OpenStationary=utmz_OpenStationary-utmz_OpenStationary(1);
% utmx_OpenWalk=utmx_OpenWalk-utmx_OpenWalk(1);
% utmy_OpenWalk=utmy_OpenWalk-utmy_OpenWalk(1);
% utmz_OpenWalk=utmz_OpenWalk-utmz_OpenWalk(1);

% %% Plot each utmx utmy utmz coordinates scales (1,1,1)
% xlabel("UTM x");
% ylabel("UTM y");
% %% ClosedStationary
% figure
% mean_x = mean(utmx_ClosedStationary);
% mean_y = mean(utmy_ClosedStationary);
% 
% scatter(utmx_ClosedStationary,utmy_ClosedStationary,5);
% hold on 
% plot(mean_x,mean_y,'+r','LineWidth',8);
% hold off
% 
% title("Stationay UTM data in Closed Area");
% xlabel("UTM x (m)");
% ylabel("UTM y (m)");
% axis equal
% 
% %% ClosedWalk
% figure
% plot(utmx_ClosedWalk,utmy_ClosedWalk);
% title("Walk UTM data in Closed Area");
% xlabel("UTM x (m)");
% ylabel("UTM y (m)");
% axis equal
% 
% %% OpenStationary
% figure
% hold on
% for i=500:length(utmx_OpenStationary)-200
%    scatter(utmx_OpenStationary(i:i+1),utmy_OpenStationary(i:i+1),5,[1,i/length(utmx_OpenStationary),0]);
% end
% hold on
% mean_x2 = mean(utmx_OpenStationary);
% mean_y2 = mean(utmy_OpenStationary);
% plot(mean_x2,mean_y2,'+b','LineWidth',8)
% 
% title("Stationary UTM Data in Open Area")
% xlabel("UTM x (m)");
% ylabel("UTM y (m)");
% axis equal
% 
% %% OpenWalk
% figure
% hold on
% %plot3(utmx_OpenWalk,utmy_OpenWalk,utmz_OpenWalk);
% %plot(utmx_OpenWalk,utmy_OpenWalk);
% for i=1:length(utmx_OpenWalk)-1
%    plot(utmx_OpenWalk(i:i+1),utmy_OpenWalk(i:i+1),'color',[1,i/length(utmx_OpenWalk),0]);
% end
% axis equal
% xlabel("UTM x (m)");
% ylabel("UTM y (m)");
% title("Walk UTM Data in Open Area")
