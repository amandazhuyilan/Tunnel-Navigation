package dbw_mkz_msgs;

public interface SteeringReport extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "dbw_mkz_msgs/SteeringReport";
  static final java.lang.String _DEFINITION = "Header header\n\n# Steering Wheel\nfloat32 steering_wheel_angle      # rad\nfloat32 steering_wheel_angle_cmd  # rad\nfloat32 steering_wheel_torque     # Nm\n\n# Vehicle Speed\nfloat32 speed                     # m/s\n\n# Status\nbool enabled  # Enabled\nbool override # Driver override\nbool driver   # Driver activity\n\n# Watchdog Counter\nbool fault_wdc\n\n# Faults\nbool fault_bus1\nbool fault_bus2\nbool fault_calibration\nbool fault_connector # This fault can be ignored\n";
  std_msgs.Header getHeader();
  void setHeader(std_msgs.Header value);
  float getSteeringWheelAngle();
  void setSteeringWheelAngle(float value);
  float getSteeringWheelAngleCmd();
  void setSteeringWheelAngleCmd(float value);
  float getSteeringWheelTorque();
  void setSteeringWheelTorque(float value);
  float getSpeed();
  void setSpeed(float value);
  boolean getEnabled();
  void setEnabled(boolean value);
  boolean getOverride();
  void setOverride(boolean value);
  boolean getDriver();
  void setDriver(boolean value);
  boolean getFaultWdc();
  void setFaultWdc(boolean value);
  boolean getFaultBus1();
  void setFaultBus1(boolean value);
  boolean getFaultBus2();
  void setFaultBus2(boolean value);
  boolean getFaultCalibration();
  void setFaultCalibration(boolean value);
  boolean getFaultConnector();
  void setFaultConnector(boolean value);
}
