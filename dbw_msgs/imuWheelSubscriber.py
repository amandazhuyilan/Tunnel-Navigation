import rospy
import sys
from dbw_mkz_msgs.msg import WheelSpeedReport
from sensor_msgs.msg import Imu

def callbackimu(data):
	#ignored header info. and covariances
	orientationX = data.orientation.x
	orientationY = data.orientation.y
	orientationZ = data.orientation.z
	orientationW = data.orientation.w

	angleX = data.angular_velocity.x
	angleY = data.angular_velocity.y
	angleZ = data.angular_velocity.z

	linearX = data.linear_acceleration.x
	linearY = data.linear_acceleration.y
	linearZ = data.linear_acceleration.z

	print orientationX,orientationZ,orientationZ,orientationW,angleX,angleY,angleZ,linearX,linearY,linearZ
	
def callbackwheel(data):
	#callback data==msg
	#rospy.loginfo(rospy.get_caller_id() + 'TOPIC heard %s', data.data)
	frontLeft = data.front_left
	frontRight = data.front_right
	rearLeft = data.rear_left
	rearRight = data.rear_right
	wheelData = 'frontLeft: ' + frontLeft + ', frontRight: ' + frontRight + ', rearLeft: ' + rearLeft + ', rearRight: ' + rearRight
	print wheelData


def listener():

	rospy.init_node('imuSubscriber_node', anonymous=True)
	rospy.init_node('wheelSubscriber_node', anonymous=True)

	rospy.Subscriber('/vehicle/imu/data_raw', Imu, callbackimu)
	rospy.Subscriber('/vehicle/wheel_speed_report', WheelSpeedReport, callbackwheel)	

    # spin() simply keeps python from exiting until this node is stopped
	rospy.spin()

if __name__ == '__main__':
	listener()