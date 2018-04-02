package dbw_mkz_msgs;

public interface ParkingBrake extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "dbw_mkz_msgs/ParkingBrake";
  static final java.lang.String _DEFINITION = "uint8 status\n\nuint8 OFF=0\nuint8 TRANS=1\nuint8 ON=2\nuint8 FAULT=3\n";
  static final byte OFF = 0;
  static final byte TRANS = 1;
  static final byte ON = 2;
  static final byte FAULT = 3;
  byte getStatus();
  void setStatus(byte value);
}
