import serial
import rospy
from sensor_msgs.msg import NavSatFix
from nav_msgs.msg import Odometry

port = serial.Serial( port = '/dev/ttyACM0', baudrate = 4800, timeout = 5)

pub = rospy.Publisher('/tunnelGPS_fix', NavSatFix, queue_size=1024)
rospy.init_node('tunnel_gps_node', anonymous=True)

#if rospy open, publish msg
while not rospy.is_shutdown():
    line = port.readline()
    data = line.split(',')

    msg = NavSatFix()
    rate = rospy.Rate(1) # 1hz?? Where to put? need or not?

    if data[0] == '$GPGGA':
        if data[2] == '':
            print 'poor gps signal'
        else:
            if data[3]=='N':
                msg.latitude = data[2]
                #convert gps latitude data to degree
                msg.latitude = float(msg.latitude[0:2]) + float(msg.latitude[2:]) / 60
            else:
                msg.latitude = data[2]
                msg.latitude = -(float(msg.latitude[0:2]) + float(msg.latitude[2:]) / 60)
            
            if data[5]=='W':
                msg.longitude = data[4]
                msg.longitude = -(float(msg.longitude[1:3]) + float(msg.longitude[3:]) / 60)
            else:
                msg.longitude = data[4]
                msg.longitude = float(msg.longitude[1:3]) + float(msg.longitude[3:]) / 60
            msg.altitude =float(data[9])
    #NMEA system. ddmm.mmmm ->degree as input of utm -> utm x,y
            lc.publish("gpsdata", msg.encode())
            pub.publish(msg)

    else:
        print 'Waiting for GPGGA signal'

    rate.sleep()
