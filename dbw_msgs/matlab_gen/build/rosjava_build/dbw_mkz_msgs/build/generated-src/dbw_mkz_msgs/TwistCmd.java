package dbw_mkz_msgs;

public interface TwistCmd extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "dbw_mkz_msgs/TwistCmd";
  static final java.lang.String _DEFINITION = "geometry_msgs/Twist twist\nfloat32 accel_limit # m/s^2, zero = no limit\nfloat32 decel_limit # m/s^2, zero = no limit\n";
  geometry_msgs.Twist getTwist();
  void setTwist(geometry_msgs.Twist value);
  float getAccelLimit();
  void setAccelLimit(float value);
  float getDecelLimit();
  void setDecelLimit(float value);
}
