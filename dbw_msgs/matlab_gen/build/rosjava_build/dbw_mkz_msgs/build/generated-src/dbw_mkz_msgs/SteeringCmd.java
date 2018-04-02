package dbw_mkz_msgs;

public interface SteeringCmd extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "dbw_mkz_msgs/SteeringCmd";
  static final java.lang.String _DEFINITION = "# Steering Wheel\nfloat32 steering_wheel_angle_cmd        # rad, range -8.2 to 8.2\nfloat32 steering_wheel_angle_velocity   # rad/s, range 0 to 8.7, 0 = maximum\n\n# Enable\nbool enable\n\n# Ignore driver overrides\nbool ignore\n\n# Disable the driver override audible warning\nbool quiet\n\n# Watchdog counter (optional)\nuint8 count\n";
  float getSteeringWheelAngleCmd();
  void setSteeringWheelAngleCmd(float value);
  float getSteeringWheelAngleVelocity();
  void setSteeringWheelAngleVelocity(float value);
  boolean getEnable();
  void setEnable(boolean value);
  boolean getIgnore();
  void setIgnore(boolean value);
  boolean getQuiet();
  void setQuiet(boolean value);
  byte getCount();
  void setCount(byte value);
}
