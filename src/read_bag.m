%% Reading ROS bag files
% change the following line based on the location of your dbw_msgs directory
% addpath('/home/amanda/Tunnel-Navigation/Tunnel-Navigation-Project/dbw_msgsdbw_msgs/matlab_gen/msggen')
% savepath

%Read in rosbag files
<<<<<<< HEAD
bag = rosbag('04-10-2018/2018-04-10-16-40-17.bag');
=======
<<<<<<< HEAD
bagcar = rosbag('04-06-2018/CAR-2018-04-06-15-14-50.bag');
rosbag filter CAR-2018-04-06-15-14-50.bag imu_mag.bag "topic = '/imu/magnetic_field'"
imu_mag = select(bagcar,'Topic','/imu/magnetic_field');
msg_imu_mag = readMessages(imu_mag);
=======
bag = rosbag('2018-04-10-16-40-17.bag');
>>>>>>> cfc560b1dee2fd41d92bca5dbd598b66284dd9e9

>>>>>>> fd18b74ef973e0f0edf81a63b3d7465f35576902
% %Filter Rosbags by topic name
gps_fix = select(bag, 'Topic','/vehicle/gps/fix');
gps_vel = select(bag, 'Topic', '/vehicle/gps/vel');
imu_imu = select(bag, 'Topic', '/imu/imu');
imu_mag = select(bag, 'Topic', '/imu/magnetic_field');
steering_report = select(bag, 'Topic', '/vehicle/steering_report');
twist = select(bag, 'Topic', '/vehicle/twist');
wheel_position = select(bag, 'Topic', '/vehicle/wheel_position_report');
wheel_speed = select(bag, 'Topic', '/vehicle/wheel_speed_report');

% 
% %Return all messages as cell array
<<<<<<< HEAD
msg_gps_fix = readMessages(gps_fix);
msg_gps_vel = readMessages(gps_vel);
msg_imu_imu = readMessages(imu_imu);
msg_imu_mag = readMessage(imu_mag);
msg_wheel_speed = readMessages(wheel_speed);
msg_steering_report = readMessage(steering_report);
msg_twist = readMessage(twist);
msg_wheel_position = readMessage(wheel_position);
=======
% msg_gps_fix = readMessages(gps_fix);
% msg_gps_vel = readMessages(gps_vel);
% msg_imu_raw = readMessages(imu_raw);
% msg_wheel_speed = readMessages(bag);
<<<<<<< HEAD
msg_imu_mag = readMessages(imu_mag);
=======
% msg_mag = readMessages(bag);
>>>>>>> fd18b74ef973e0f0edf81a63b3d7465f35576902

%% Convert Cell Arrays
>>>>>>> cfc560b1dee2fd41d92bca5dbd598b66284dd9e9

%% gps_fix
% gps_time = zeros(size(msg_gps_fix));
% gps_lat = zeros(size(msg_gps_fix));
% gps_long = zeros(size(msg_gps_fix));
% 
% for n=1:1:size(msg_gps_fix)
%     temp = msg_gps_fix{n,1};
% %     gps_lat(n) = temp.Latitude;
% %     gps_long(n) = temp.Longitude;
% end
% 
 
% wheel_speed
% wheel_frontLeft = zeros(size(msg_wheel_speed));
% wheel_frontRight = zeros(size(msg_wheel_speed));
% wheel_rearLeft = zeros(size(msg_wheel_speed));
% wheel_rearRight = zeros(size(msg_wheel_speed));
% 
% for n=1:1:size(msg_wheel_speed)
%     temp = msg_wheel_speed{n,1};
%     wheel_frontLeft(n) = temp.FrontLeft;
%     wheel_frontRight(n) = temp.FrontRight;
%     wheel_rearLeft(n) = temp.RearLeft;
%     wheel_rearRight(n) = temp.RearRight;
% end




%% imu_mag data
% mag_x = zeros(size(msg_imu_mag));
% mag_y = zeros(size(msg_imu_mag));
% mag_z = zeros(size(msg_imu_mag));
% 
% 
% for n=1:1:size(msg_imu_mag)
%     temp = msg_mag{n,1};
%     mag_x(n) = temp.MagneticField_.X;
%     mag_y(n) = temp.MagneticField_.Y;
%     mag_z(n) = temp.MagneticField_.Z;
% end


% figure 
% subplot(3,1,1)
% plot(gps_lat(310:end))
% title("GPS Latitude")
% 
% subplot(3,1,2)
% plot(gps_long(310:end))
% title("GPS Longitude")
% 
% subplot(3,1,3)
% plot(gps_alt(310:end))
% title("GPS Altitude")




