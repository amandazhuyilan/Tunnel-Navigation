package dbw_mkz_msgs;

public interface AmbientLight extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "dbw_mkz_msgs/AmbientLight";
  static final java.lang.String _DEFINITION = "uint8 status\n\nuint8 DARK=0\nuint8 LIGHT=1\nuint8 TWILIGHT=2\nuint8 TUNNEL_ON=3\nuint8 TUNNEL_OFF=4\nuint8 NO_DATA=7\n";
  static final byte DARK = 0;
  static final byte LIGHT = 1;
  static final byte TWILIGHT = 2;
  static final byte TUNNEL_ON = 3;
  static final byte TUNNEL_OFF = 4;
  static final byte NO_DATA = 7;
  byte getStatus();
  void setStatus(byte value);
}
