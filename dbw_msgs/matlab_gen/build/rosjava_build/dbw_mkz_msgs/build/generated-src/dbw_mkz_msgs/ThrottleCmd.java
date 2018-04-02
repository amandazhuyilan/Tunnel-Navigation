package dbw_mkz_msgs;

public interface ThrottleCmd extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "dbw_mkz_msgs/ThrottleCmd";
  static final java.lang.String _DEFINITION = "# Throttle pedal\n# Options defined below\nfloat32 pedal_cmd\nuint8 pedal_cmd_type\n\n# Enable\nbool enable\n\n# Ignore driver overrides\nbool ignore\n\n# Watchdog counter (optional)\nuint8 count\n\nuint8 CMD_NONE=0\nuint8 CMD_PEDAL=1   # Unitless, range 0.15 to 0.80\nuint8 CMD_PERCENT=2 # Percent of maximum throttle, range 0 to 1\n";
  static final byte CMD_NONE = 0;
  static final byte CMD_PEDAL = 1;
  static final byte CMD_PERCENT = 2;
  float getPedalCmd();
  void setPedalCmd(float value);
  byte getPedalCmdType();
  void setPedalCmdType(byte value);
  boolean getEnable();
  void setEnable(boolean value);
  boolean getIgnore();
  void setIgnore(boolean value);
  byte getCount();
  void setCount(byte value);
}
