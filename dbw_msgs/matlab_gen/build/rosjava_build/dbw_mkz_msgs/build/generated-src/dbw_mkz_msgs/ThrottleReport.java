package dbw_mkz_msgs;

public interface ThrottleReport extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "dbw_mkz_msgs/ThrottleReport";
  static final java.lang.String _DEFINITION = "Header header\n\n# Throttle pedal\n# Unitless, range 0.15 to 0.50\nfloat32 pedal_input\nfloat32 pedal_cmd\nfloat32 pedal_output\n\n# Status\nbool enabled  # Enabled\nbool override # Driver override\nbool driver   # Driver activity\n\n# Watchdog Counter\nWatchdogCounter watchdog_counter\nbool fault_wdc\n\n# Faults\nbool fault_ch1\nbool fault_ch2\nbool fault_connector # This fault can be ignored\n";
  std_msgs.Header getHeader();
  void setHeader(std_msgs.Header value);
  float getPedalInput();
  void setPedalInput(float value);
  float getPedalCmd();
  void setPedalCmd(float value);
  float getPedalOutput();
  void setPedalOutput(float value);
  boolean getEnabled();
  void setEnabled(boolean value);
  boolean getOverride();
  void setOverride(boolean value);
  boolean getDriver();
  void setDriver(boolean value);
  dbw_mkz_msgs.WatchdogCounter getWatchdogCounter();
  void setWatchdogCounter(dbw_mkz_msgs.WatchdogCounter value);
  boolean getFaultWdc();
  void setFaultWdc(boolean value);
  boolean getFaultCh1();
  void setFaultCh1(boolean value);
  boolean getFaultCh2();
  void setFaultCh2(boolean value);
  boolean getFaultConnector();
  void setFaultConnector(boolean value);
}
