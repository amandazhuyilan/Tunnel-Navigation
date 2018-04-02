package dbw_mkz_msgs;

public interface HillStartAssist extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "dbw_mkz_msgs/HillStartAssist";
  static final java.lang.String _DEFINITION = "uint8 status\nuint8 mode\n\nuint8 STAT_INACTIVE=0\nuint8 STAT_FINDING_GRADIENT=1\nuint8 STAT_ACTIVE_PRESSED=2\nuint8 STAT_ACTIVE_RELEASED=3\nuint8 STAT_FAST_RELEASE=4\nuint8 STAT_SLOW_RELEASE=5\nuint8 STAT_FAILED=6\nuint8 STAT_UNDEFINED=7\n\nuint8 MODE_OFF=0\nuint8 MODE_AUTO=1\nuint8 MODE_MANUAL=2\nuint8 MODE_UNDEFINED=3\n";
  static final byte STAT_INACTIVE = 0;
  static final byte STAT_FINDING_GRADIENT = 1;
  static final byte STAT_ACTIVE_PRESSED = 2;
  static final byte STAT_ACTIVE_RELEASED = 3;
  static final byte STAT_FAST_RELEASE = 4;
  static final byte STAT_SLOW_RELEASE = 5;
  static final byte STAT_FAILED = 6;
  static final byte STAT_UNDEFINED = 7;
  static final byte MODE_OFF = 0;
  static final byte MODE_AUTO = 1;
  static final byte MODE_MANUAL = 2;
  static final byte MODE_UNDEFINED = 3;
  byte getStatus();
  void setStatus(byte value);
  byte getMode();
  void setMode(byte value);
}
