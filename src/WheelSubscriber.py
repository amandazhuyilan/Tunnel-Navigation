#!/usr/bin/env python

import rospy
import sys
from dbw_mkz_msgs.msg import WheelSpeedReport
# from sensor_msgs.msg import Imu
from nav_msgs.msg import Odometry

def callbackwheel(data):
    #callback data==msg
    #rospy.loginfo(rospy.get_caller_id() + 'TOPIC heard %s', data.data)
    wheel_speed = WheelSpeedReport()

    frontLeft = data.front_left
    frontRight = data.front_right
    rearLeft = data.rear_left
    rearRight = data.rear_right
    print 'frontLeft: ' + frontLeft + ', frontRight: ' + frontRight + ', rearLeft: ' + rearLeft + ', rearRight: ' + rearRight    

def wheelspeed_listener():
    rospy.init_node('wheelSubscriber_node', anonymous=True)
    
    rospy.Subscriber('/vehicle/wheel_speed_report', WheelSpeedReport, callbackwheel)    
    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()

if __name__ == '__main__':
    try:
        print 'wheel_subscriber_node running!\n'
        wheelspeed_listener()
    except rospy.ROSInterruptException:
        pass
