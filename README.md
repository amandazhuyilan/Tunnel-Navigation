## Tunnel Navigation

Our robotics course project to navigate vehicle through tunnels and areas of low GPS reception with the vehicle's built in acceleration and encoder, to give users accurate turn-by-turn directions. Limited to the scope of this project, we will be running our prototype based on the data collected through the Thomas P. O'Neil tunnel located in Boston, MA.

## Tools and Resources
- Open source Navigation software that runs on multiple OS platforms: [Navit](https://github.com/navit-gps/navit)
- [ROS interface to Lincoln MKZ](https://drive.google.com/open?id=191uEPJnzKvJLzp2A-HyDsfB6DPPajgv8)
- A Lincoln MKZ modified with a [Dataspeed ADAS package](http://dataspeedinc.com/wp-content/uploads/2016/11/adas-kit.pdf)


### Instructions to read dbw_mkz rosbag into Matlab

Before the rosbag can be read into Matlab, you need to add the dbw_mkz message definations to Matlab. I have already 'generated' the matlab messages and the jar file. You can download it by copying the folder from [HERE](https://drive.google.com/open?id=0B6xwBH7R5H0-M1o2andQQTNCU1k) (also in the ```dbw_mkz_msgs``` folder in the repo ).
To add these to your Matlab, here are the following steps:
- 1. Edit javaclasspath.txt, add the following file locations as new lines, and save the file:
Location of the javaclasspath.txt depends on your installation of matlab. This link has more details on where you can find it : https://www.mathworks.com/help/matlab/matlab_external/static-path.html#bvnynym
Full address of the dbw_mkz_msgs-1.0.4.jar file that you downloaded above. 

For my installation it is: ```/home/vik748/dbw_msgs/matlab_gen/jar/dbw_mkz_msgs-1.0.4.jar```

- 2. Add the custom message folder to the MATLAB path by executing:
Full address of the msggen folder that you downloaded above. For my installation it is 
```
addpath('/home/vik748/dbw_msgs/matlab_gen/msggen')
savepath
```

- 3. Restart MATLAB and verify that you can use the custom messages. 
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

### Things to do:
- Use Matlab's ```rossubscriber``` function to subscribe to ros topis that we care about:
    - ```/vehicle/gps/fix```            (1 Hz, latitude, longitude, altitude)
    - ```/vehicle/gps/time```   
    - ```/vehicle/gps/vel```            (50 Hz, speed and yaw rate computed from steering report)
    - ```/vehicle/imu/data_raw```       (100 Hz, accel, gyro, missing pitch gyro)
    - ```/vehicle/wheel_speed_report``` (100 Hz, wheel speeds, magnitude only)

and process it real time, show pop-up windows for notifications for directions.

- Features want to be done on Matlab:
    - When GPS signal falls below a certain threshold, translating wheel speed data to GPS data.
    - With Google Maps API:
        - Get directions with user's input start and destination.
        - Can we plot our route by POSTing our GPS to Google Maps API? 

- Look through Navit open-source navigation software in detail, need to figure out and present the following:
    - How and where does Navit reads its GPS data from?
    - How does it updates location on map?
    - Can we feed it with our own GPS data?

    



