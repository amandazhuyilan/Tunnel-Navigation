package dbw_mkz_msgs;

public interface TurnSignalCmd extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "dbw_mkz_msgs/TurnSignalCmd";
  static final java.lang.String _DEFINITION = "# Turn signal command enumeration\nTurnSignal cmd\n";
  dbw_mkz_msgs.TurnSignal getCmd();
  void setCmd(dbw_mkz_msgs.TurnSignal value);
}
