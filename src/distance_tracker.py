# !/usr/bin/env python
import rospy
import sys
import math
import numpy
from dbw_mkz_msgs.msg import WheelSpeedReport
from geometry_msgs.msg import TwistStamped
from nav_msgs.msg import Odometry


def callbackwheel(data):

    wheel_speed = WheelSpeedReport()
    frontLeft = data.front_left
    frontRight = data.front_right
    rearLeft = data.rear_left
    rearRight = data.rear_right

def callbacktwist(data):
    global last_time, past_distance, dist_tracker

    timestamp= data.header.stamp
    time_diff = (timestamp-last_time).to_sec()
    #print 'Time Difference:' + str(time_diff)
    linear_vel_x = data.twist.linear.x
    #print 'Linear Velocity:' + str(linear_vel_x)
    distance_covered = past_distance + linear_vel_x * time_diff
    #print 'Distance: ' + str(distance_covered) + '\n'
    distance_tracker(distance_covered)

    #Updating Value
    past_distance = distance_covered
    last_time = timestamp

def wheelspeed_listener():

    rospy.init_node('wheelSubscriber_node', anonymous=True)
    rospy.Subscriber('/vehicle/wheel_speed_report', WheelSpeedReport, callbackwheel)
    rospy.Subscriber("vehicle/twist",TwistStamped, callbacktwist)
    rospy.spin()

def distance_tracker(distance_covered):
    global i,dist_tracker,a0,a1,a2,a3,a4,a5,a6
    instruction = ['Head northwest', 'Turn left toward Mystic Ave', 'Turn left toward Mystic Ave',
                   'Turn right toward Mystic Ave', 'Turn right onto Mystic Ave', 'Continue onto Bailey Rd',
                   'Turn left onto the ramp to I-93 S',
                   'Keep left at the fork, follow signs for I-93 S/Boston and merge onto I-93 S',
                   'Keep left to stay on I-93 S', 'Take exit 20A-20B toward South Station',
                   'Merge onto John F Fitzgerald Surface Rd/Surface Rd',
                   'Turn right onto Kneeland StPass by E Boston Savings Bank (on the left)',
                   'Turn left at the 3rd cross street onto Harrison Ave Destination will be on the left']

    distance_covered=int(distance_covered)
    subroute_distance = [15,59,48,29,356,236,441,3755,1049,496,491,153,137]
    subroute_distance_sum = []
    subroute_distance_sum.append(subroute_distance[0])

    for index in range(1, len(subroute_distance)):
        subroute_distance_sum.append(subroute_distance_sum[index - 1] + subroute_distance[index])

    if subroute_distance_sum[i]-distance_covered > 0:
        if int(round(subroute_distance_sum[i]-distance_covered))>0:
            if a0 == 0:
                print instruction[i] + ' after ' + str(int(round(subroute_distance_sum[i]-distance_covered))) + 'm'
                a0=a0+1
        if int(round(subroute_distance_sum[i]-distance_covered))==1000:
            if a1 == 0:
                print instruction[i] + ' after ' + str(int(round(subroute_distance_sum[i]-distance_covered))) + 'm'
                a1=a1+1
        if int(round(subroute_distance_sum[i]-distance_covered))==750:
            if a2 == 0:
                print instruction[i] + ' after ' + str(int(round(subroute_distance_sum[i]-distance_covered))) + 'm'
                a2=a2+1
        if int(round(subroute_distance_sum[i]-distance_covered))==500:
            if a3 == 0:
                print instruction[i] + ' after ' + str(int(round(subroute_distance_sum[i]-distance_covered))) + 'm'
                a3=a3+1
        if int(round(subroute_distance_sum[i]-distance_covered))==200:
            if a4 == 0:
                print instruction[i] + ' after ' + str(int(round(subroute_distance_sum[i]-distance_covered))) + 'm'
                a4=a4+1

        if int(round(subroute_distance_sum[i]-distance_covered))==100:
            if a5==0:
                print instruction[i] + ' after ' + str(int(round(subroute_distance_sum[i]-distance_covered))) + 'm'
                a5=a5+1
        if int(round(subroute_distance_sum[i]-distance_covered))==20:
            if a6==0:
                print instruction[i] + ' after ' + str(int(round(subroute_distance_sum[i]-distance_covered))) + 'm'
                a6=a6+1
    elif (i<12):
        i=i+1
        a1=0;a2=0;a3=0;a4=0;a5=0;a6=0
        print instruction[i] + ' after ' + str(int(round(subroute_distance_sum[i] - distance_covered))) + 'm'
    else:
        print"Destination Reached!"
        rospy.sleep(1)
if __name__ == '__main__':
    try:
        i=0
        j=0
        a0=0;a1=0; a2=0; a3=0; a4=0; a5=0; a6=0
        past_distance=0
        dist_tracker=0
        last_time=rospy.Time.from_sec(0.0)
        print 'Subscriber Nodes running!\n'
        wheelspeed_listener()
    except rospy.ROSInterruptException:
        pass
