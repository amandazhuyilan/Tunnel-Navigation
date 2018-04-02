package dbw_mkz_msgs;

public interface ThrottleInfoReport extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "dbw_mkz_msgs/ThrottleInfoReport";
  static final java.lang.String _DEFINITION = "Header header\n\n# Throttle Pedal\nfloat32 throttle_pc   # Throttle pedal percent, range 0 to 1\nfloat32 throttle_rate # Throttle pedal change per second (1/s)\n\n# Engine\nfloat32 engine_rpm    # Engine Speed (rpm)\n";
  std_msgs.Header getHeader();
  void setHeader(std_msgs.Header value);
  float getThrottlePc();
  void setThrottlePc(float value);
  float getThrottleRate();
  void setThrottleRate(float value);
  float getEngineRpm();
  void setEngineRpm(float value);
}
