package dbw_mkz_msgs;

public interface WatchdogCounter extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "dbw_mkz_msgs/WatchdogCounter";
  static final java.lang.String _DEFINITION = "uint8 source\n\nuint8 NONE=0               # No source for watchdog counter fault\nuint8 OTHER_BRAKE=1        # Fault determined by brake controller\nuint8 OTHER_THROTTLE=2     # Fault determined by throttle controller\nuint8 OTHER_STEERING=3     # Fault determined by steering controller\nuint8 BRAKE_COUNTER=4      # Brake command counter failed to increment\nuint8 BRAKE_DISABLED=5     # Brake transition to disabled while in gear or moving\nuint8 BRAKE_COMMAND=6      # Brake command timeout after 100ms\nuint8 BRAKE_REPORT=7       # Brake report timeout after 100ms\nuint8 THROTTLE_COUNTER=8   # Throttle command counter failed to increment\nuint8 THROTTLE_DISABLED=9  # Throttle transition to disabled while in gear or moving\nuint8 THROTTLE_COMMAND=10  # Throttle command timeout after 100ms\nuint8 THROTTLE_REPORT=11   # Throttle report timeout after 100ms\nuint8 STEERING_COUNTER=12  # Steering command counter failed to increment\nuint8 STEERING_DISABLED=13 # Steering transition to disabled while in gear or moving\nuint8 STEERING_COMMAND=14  # Steering command timeout after 100ms\nuint8 STEERING_REPORT=15   # Steering report timeout after 100ms\n";
  static final byte NONE = 0;
  static final byte OTHER_BRAKE = 1;
  static final byte OTHER_THROTTLE = 2;
  static final byte OTHER_STEERING = 3;
  static final byte BRAKE_COUNTER = 4;
  static final byte BRAKE_DISABLED = 5;
  static final byte BRAKE_COMMAND = 6;
  static final byte BRAKE_REPORT = 7;
  static final byte THROTTLE_COUNTER = 8;
  static final byte THROTTLE_DISABLED = 9;
  static final byte THROTTLE_COMMAND = 10;
  static final byte THROTTLE_REPORT = 11;
  static final byte STEERING_COUNTER = 12;
  static final byte STEERING_DISABLED = 13;
  static final byte STEERING_COMMAND = 14;
  static final byte STEERING_REPORT = 15;
  byte getSource();
  void setSource(byte value);
}
