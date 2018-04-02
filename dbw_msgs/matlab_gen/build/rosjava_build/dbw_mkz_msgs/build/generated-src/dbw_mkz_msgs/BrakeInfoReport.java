package dbw_mkz_msgs;

public interface BrakeInfoReport extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "dbw_mkz_msgs/BrakeInfoReport";
  static final java.lang.String _DEFINITION = "Header header\n\n# Wheel torques (Nm)\nfloat32 brake_torque_request\nfloat32 brake_torque_actual\nfloat32 wheel_torque_actual\n\n# Vehicle Acceleration (m/s^2)\nfloat32 accel_over_ground\n\n# Hill Start Assist\nHillStartAssist hsa\n\n# Anti-lock Brakes\nbool abs_active\nbool abs_enabled\n\n# Stability Control\nbool stab_active\nbool stab_enabled\n\n# Traction Control\nbool trac_active\nbool trac_enabled\n\n# Parking Brake\nParkingBrake parking_brake\n\n# Misc\nbool stationary\n";
  std_msgs.Header getHeader();
  void setHeader(std_msgs.Header value);
  float getBrakeTorqueRequest();
  void setBrakeTorqueRequest(float value);
  float getBrakeTorqueActual();
  void setBrakeTorqueActual(float value);
  float getWheelTorqueActual();
  void setWheelTorqueActual(float value);
  float getAccelOverGround();
  void setAccelOverGround(float value);
  dbw_mkz_msgs.HillStartAssist getHsa();
  void setHsa(dbw_mkz_msgs.HillStartAssist value);
  boolean getAbsActive();
  void setAbsActive(boolean value);
  boolean getAbsEnabled();
  void setAbsEnabled(boolean value);
  boolean getStabActive();
  void setStabActive(boolean value);
  boolean getStabEnabled();
  void setStabEnabled(boolean value);
  boolean getTracActive();
  void setTracActive(boolean value);
  boolean getTracEnabled();
  void setTracEnabled(boolean value);
  dbw_mkz_msgs.ParkingBrake getParkingBrake();
  void setParkingBrake(dbw_mkz_msgs.ParkingBrake value);
  boolean getStationary();
  void setStationary(boolean value);
}
