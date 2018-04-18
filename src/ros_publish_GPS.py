import serial
import rospy
from sensor_msgs.msg import NavSatFix


def publishGPS():
    ser = serial.Serial(port='/dev/ttyACM0', baudrate=4800, timeout=5)

    pub = rospy.Publisher('/tunnelGPS_fix', NavSatFix, queue_size=1024)
    rospy.init_node('tunnel_gps_node', anonymous=True)
    rate = rospy.Rate(1)  # 1Hz

    NavStat_msg = NavSatFix()

    while not rospy.is_shutdown():
        line_raw = ser.readline()
        line = line_raw.split(',')
        if line[0] == "GPGGA":
            NavStat_msg.time = line[1]
            if line[2] == '':
                print "No GPS Signal"
            else:
                if line[3] == 'N':
                    NavStat_msg.latitude = float(line[2])
                else:
                    NavStat_msg.latitude = - float(line[2])
                if line[5] == 'E':
                    NavStat_msg.longitude = float(line[4])
                else:
                    NavStat_msg.longitude = - float(line[4])
                NavStat_msg.altitude = line[9]

        pub.publish(NavStat_msg)

        print "Publishing: lat = " + NavStat_msg.latitude + " long = " + NavStat_msg.longitude + " alt = " + NavStat_msg.altitude

if __name__ == 'main':
    try:
        publishGPS()
    except rospy.ROSInterruptException:
        pass
