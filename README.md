## Tunnel Navigation

Our robotics course project to navigate vehicle through tunnels and areas of low GPS reception with the vehicle's built in acceleration and encoder, to give users accurate turn-by-turn directions. Limited to the scope of this project, we will be running our prototype based on the data collected through the Thomas P. O'Neil tunnel located in Boston, MA.

## Tools and Resources
- Open source Navigation software that runs on multiple OS platforms: [Navit](https://github.com/navit-gps/navit)
- [ROS interface to Lincoln MKZ](https://drive.google.com/open?id=191uEPJnzKvJLzp2A-HyDsfB6DPPajgv8)
- A Lincoln MKZ modified with a [Dataspeed ADAS package](http://dataspeedinc.com/wp-content/uploads/2016/11/adas-kit.pdf)

### Info about Akerman Steering Modelling Milestones
- Implement Ackermann steering model
    - Input: 4 wheel encoders and steering angle -> output: x-velocity, y-velocity and angular rate
    - Measure / estimate model parameters by experimentation
    - Create a ROS node for implementing the Akerman model -
    - http://autsys.aalto.fi/fsr/attach/Material/Odometry_sensors.pdf
    - http://wiki.ros.org/Ackermann%20Group

- Compare performance of pure odometry to GPS and IMU 
- Fuse odometry, GPS and IMU possibly using the ekf_localization_node from robot localization package http://docs.ros.org/lunar/api/robot_localization/html/index.html
- Implement the ROS Gmapping, Cartographer or other SLAM package for mapping and localization.


### Instructions to read dbw_mkz rosbag into Matlab

Before the rosbag can be read into Matlab, you need to add the dbw_mkz message definations to Matlab. I have already 'generated' the matlab messages and the jar file. You can download it by copying the folder from [HERE](https://drive.google.com/open?id=0B6xwBH7R5H0-M1o2andQQTNCU1k) (also in the ```dbw_mkz_msgs``` folder in the repo ).
To add these to your Matlab, here are the following steps:
1. Edit javaclasspath.txt, add the following file locations as new lines, and save the file:
Location of the javaclasspath.txt depends on your installation of matlab. This link has more details on where you can find it : https://www.mathworks.com/help/matlab/matlab_external/static-path.html#bvnynym
Full address of the dbw_mkz_msgs-1.0.4.jar file that you downloaded above. 

For my installation it is: ```/home/vik748/dbw_msgs/matlab_gen/jar/dbw_mkz_msgs-1.0.4.jar```

2. Add the custom message folder to the MATLAB path by executing:
Full address of the msggen folder that you downloaded above. For my installation it is 
```
addpath('/home/vik748/dbw_msgs/matlab_gen/msggen')
savepath
```

3. Restart MATLAB and verify that you can use the custom messages. 
Type "rosmsg list" and ensure that the output contains the generated
custom message types.
Once the definations are installed, you can access the variables as follows:

```
bagselect = rosbag('c:/Users/vik748/Downloads/2017-01-21-17-39-57.bag');
bagsteering = select(bagselect, 'Topic','/vehicle/steering_report');
msg = readMessages(bagsteering,1)
steeringvalue = msg{1}
steeringvalue.SteeringWheelAngle

steeringvalue.Header.Stamp.Sec % For time stamp seconds
steeringvalue.Header.Stamp.NSec % For time stamp nano seconds
```

If you just need a time_series for steering angles, you can use:
ts = timeseries(bagsteering, 'SteeringWheelAngle')

### Data Processing

1. Splitting into smaller rosbags based on topics:

``` rosbag filter CAR.bag GPS_fix.bag "topic = '/vehicle/GPS_fix'"```
2.  Reading into MATLAB (change ```addpath``` variables accordingly) and convert to csv files
    - csv format files saved under /Data/DATE/ cvs

### Rosbag record instruction
```rosbag record /vehicle/steering_report /imu/imu /imu/magnetic_field /vehicle/gps/fix /vehicle/gps/vel /vehicle/twist /vehicle/wheel_speed_report /vehicle/wheel_position_report```

    