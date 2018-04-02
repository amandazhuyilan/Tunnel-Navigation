%% Reading ROS bag files
% change the following line based on the location of your dbw_msgs directory
addpath('/home/amanda/Tunnel-Navigation/Tunnel-Navigation-Project/dbw_msgs/matlab_gen/msggen')
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
msg_gps_time = readMessages(gps_time);
msg_gps_vel = readMessages(gps_vel);
msg_imu_raw = readMessages(imu_raw);
msg_wheel_speed = readMessages(wheel_speed);

%% Convert Cell Arrays

% gps_fix
gps_lat = zeros(size(msg_gps_fix));
gps_long = zeros(size(msg_gps_fix));
gps_alt = zeros(size(msg_gps_fix));

for n=1:1:size(msg_gps_fix)
    temp = msg_gps_fix{n,1};
    gps_lat(n) = temp.Latitude;
    gps_long(n) = temp.Longitude;
    gps_alt(n) = temp.Altitude;
end

% gps_time
gps_timestamp = zeros(size(msg_gps_time));

for n=1:1:size(msg_gps_time)
    temp = msg_gps_time{n,1};
    gps_timestamp(n) = temp.TimeRef.Sec;
end

%gps_vel- gps velocity twist in linear and angular
gps_twist_lin_x = zeros(size(msg_gps_vel));
gps_twist_lin_y = zeros(size(msg_gps_vel));
gps_twist_lin_z = zeros(size(msg_gps_vel));

gps_twist_ang_x = zeros(size(msg_gps_vel));
gps_twist_ang_y = zeros(size(msg_gps_vel));
gps_twist_ang_z = zeros(size(msg_gps_vel));

for n=1:1:size(msg_gps_vel)
    temp = msg_gps_vel{n,1};
    gps_twist_lin_x(n) = temp.Twist.Linear.X;
    gps_twist_lin_y(n) = temp.Twist.Linear.Y;
    gps_twist_lin_z(n) = temp.Twist.Linear.Z;
    
    gps_twist_ang_x(n) = temp.Twist.Angular.X;
    gps_twist_ang_y(n) = temp.Twist.Angular.Y;
    gps_twist_ang_z(n) = temp.Twist.Angular.Z;
end

% imu_raw: AngularVelocity, Linear Acceleration
imu_ang_vel_x = zeros(size(msg_imu_raw));
imu_ang_vel_y = zeros(size(msg_imu_raw));
imu_ang_vel_z = zeros(size(msg_imu_raw));

imu_lin_acc_x = zeros(size(msg_imu_raw));
imu_lin_acc_y = zeros(size(msg_imu_raw));
imu_lin_acc_z = zeros(size(msg_imu_raw));

for n=1:1:size(msg_imu_raw)
    temp = msg_imu_raw{n,1};
    imu_ang_vel_x = temp.AngularVelocity.X;
    imu_ang_vel_y = temp.AngularVelocity.Y;
    imu_ang_vel_z = temp.AngularVelocity.Z;
    
    imu_lin_acc_x = temp.LinearAcceleration.X;
    imu_lin_acc_y = temp.LinearAcceleration.Y;
    imu_lin_acc_z = temp.LinearAcceleration.Z;
end

% wheel_speed
wheel_frontLeft = zeros(size(msg_wheel_speed));
wheel_frontRight = zeros(size(msg_wheel_speed));
wheel_rearLeft = zeros(size(msg_wheel_speed));
wheel_rearRight = zeros(size(msg_wheel_speed));

for n=1:1:size(msg_wheel_speed)
    temp = msg_wheel_speed{n,1};
    wheel_frontLeft = temp.FrontLeft;
    wheel_frontRight = temp.FrontRight;
    wheel_rearLeft = temp.RearLeft;
    wheel_rearRight = temp.RearRight;
end




