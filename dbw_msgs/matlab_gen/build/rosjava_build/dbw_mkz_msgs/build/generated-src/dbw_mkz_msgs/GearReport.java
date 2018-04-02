package dbw_mkz_msgs;

public interface GearReport extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "dbw_mkz_msgs/GearReport";
  static final java.lang.String _DEFINITION = "Header header\n\n# Current gear enumeration\nGear state\n\n# Gear command enumeration\nGear cmd\n\n# Status\nbool override\n\n# Faults\nbool fault_bus\n";
  std_msgs.Header getHeader();
  void setHeader(std_msgs.Header value);
  dbw_mkz_msgs.Gear getState();
  void setState(dbw_mkz_msgs.Gear value);
  dbw_mkz_msgs.Gear getCmd();
  void setCmd(dbw_mkz_msgs.Gear value);
  boolean getOverride();
  void setOverride(boolean value);
  boolean getFaultBus();
  void setFaultBus(boolean value);
}
