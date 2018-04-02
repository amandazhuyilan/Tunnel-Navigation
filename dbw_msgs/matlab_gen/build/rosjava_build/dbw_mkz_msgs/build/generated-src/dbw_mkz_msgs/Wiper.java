package dbw_mkz_msgs;

public interface Wiper extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "dbw_mkz_msgs/Wiper";
  static final java.lang.String _DEFINITION = "uint8 status\n\nuint8 OFF=0\nuint8 AUTO_OFF=1\nuint8 OFF_MOVING=2\nuint8 MANUAL_OFF=3\nuint8 MANUAL_ON=4\nuint8 MANUAL_LOW=5\nuint8 MANUAL_HIGH=6\nuint8 MIST_FLICK=7\nuint8 WASH=8\nuint8 AUTO_LOW=9\nuint8 AUTO_HIGH=10\nuint8 COURTESYWIPE=11\nuint8 AUTO_ADJUST=12\nuint8 RESERVED=13\nuint8 STALLED=14\nuint8 NO_DATA=15\n";
  static final byte OFF = 0;
  static final byte AUTO_OFF = 1;
  static final byte OFF_MOVING = 2;
  static final byte MANUAL_OFF = 3;
  static final byte MANUAL_ON = 4;
  static final byte MANUAL_LOW = 5;
  static final byte MANUAL_HIGH = 6;
  static final byte MIST_FLICK = 7;
  static final byte WASH = 8;
  static final byte AUTO_LOW = 9;
  static final byte AUTO_HIGH = 10;
  static final byte COURTESYWIPE = 11;
  static final byte AUTO_ADJUST = 12;
  static final byte RESERVED = 13;
  static final byte STALLED = 14;
  static final byte NO_DATA = 15;
  byte getStatus();
  void setStatus(byte value);
}
