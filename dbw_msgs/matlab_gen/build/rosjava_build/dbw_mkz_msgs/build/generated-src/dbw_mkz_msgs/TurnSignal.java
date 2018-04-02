package dbw_mkz_msgs;

public interface TurnSignal extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "dbw_mkz_msgs/TurnSignal";
  static final java.lang.String _DEFINITION = "uint8 value\n\nuint8 NONE=0\nuint8 LEFT=1\nuint8 RIGHT=2\n";
  static final byte NONE = 0;
  static final byte LEFT = 1;
  static final byte RIGHT = 2;
  byte getValue();
  void setValue(byte value);
}
