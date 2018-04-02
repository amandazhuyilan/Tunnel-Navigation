package dbw_mkz_msgs;

public interface GearCmd extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "dbw_mkz_msgs/GearCmd";
  static final java.lang.String _DEFINITION = "# Gear command enumeration\nGear cmd\n";
  dbw_mkz_msgs.Gear getCmd();
  void setCmd(dbw_mkz_msgs.Gear value);
}
