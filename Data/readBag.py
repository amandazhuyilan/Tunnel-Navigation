
import rosbag
bag = rosbag.Bag('2018-03-29-13-51-38.bag')
print "/vehicle/gps/fix "
for topic, msg, t in bag.read_messages(topics=['/vehicle/gps/fix']):
    print msg 
    print "\n"

print "/vehicle/gps/time "
for topic, msg, t in bag.read_messages(topics=['/vehicle/gps/time']):
    print msg
    print "\n"

print "/vehicle/gps/vel "
for topic, msg, t in bag.read_messages(topics=['/vehicle/gps/vel']):
    print msg
    print "\n"

print "/vehicle/imu/data_raw "
for topic, msg, t in bag.read_messages(topics=['/vehicle/imu/data_raw']):
    print msg
    print "\n"

print "/vehicle/wheel_speed_report"
for topic, msg, t in bag.read_messages(topics=['/vehicle/wheel_speed_report']):
    print msg
    print "\n";
bag.close()