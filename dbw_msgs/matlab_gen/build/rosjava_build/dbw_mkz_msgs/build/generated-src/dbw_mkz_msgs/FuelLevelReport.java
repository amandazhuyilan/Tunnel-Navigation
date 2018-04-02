package dbw_mkz_msgs;

public interface FuelLevelReport extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "dbw_mkz_msgs/FuelLevelReport";
  static final java.lang.String _DEFINITION = "Header header\n\n# Fuel level (%, 0 to 100)\nfloat32 fuel_level\n";
  std_msgs.Header getHeader();
  void setHeader(std_msgs.Header value);
  float getFuelLevel();
  void setFuelLevel(float value);
}
