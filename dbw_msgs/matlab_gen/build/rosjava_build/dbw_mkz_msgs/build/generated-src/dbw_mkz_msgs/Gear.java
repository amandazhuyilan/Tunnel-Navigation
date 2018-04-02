package dbw_mkz_msgs;

public interface Gear extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "dbw_mkz_msgs/Gear";
  static final java.lang.String _DEFINITION = "uint8 gear\n\nuint8 NONE=0\nuint8 PARK=1\nuint8 REVERSE=2\nuint8 NEUTRAL=3\nuint8 DRIVE=4\nuint8 LOW=5\n";
  static final byte NONE = 0;
  static final byte PARK = 1;
  static final byte REVERSE = 2;
  static final byte NEUTRAL = 3;
  static final byte DRIVE = 4;
  static final byte LOW = 5;
  byte getGear();
  void setGear(byte value);
}
