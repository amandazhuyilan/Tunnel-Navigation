package dbw_mkz_msgs;

public interface BrakeCmd extends org.ros.internal.message.Message {
  static final java.lang.String _TYPE = "dbw_mkz_msgs/BrakeCmd";
  static final java.lang.String _DEFINITION = "# Brake pedal\n# Options defined below\nfloat32 pedal_cmd\nuint8 pedal_cmd_type\n\n# Brake On Off (BOO), brake lights\nbool boo_cmd\n\n# Enable\nbool enable\n\n# Ignore driver overrides\nbool ignore\n\n# Watchdog counter (optional)\nuint8 count\n\nuint8 CMD_NONE=0\nuint8 CMD_PEDAL=1   # Unitless, range 0.15 to 0.50\nuint8 CMD_PERCENT=2 # Percent of maximum torque, range 0 to 1\nuint8 CMD_TORQUE=3  # Nm, range 0 to 3250\n\nfloat32 TORQUE_BOO=520  # Nm, brake lights threshold\nfloat32 TORQUE_MAX=3412 # Nm, maximum torque\n";
  static final byte CMD_NONE = 0;
  static final byte CMD_PEDAL = 1;
  static final byte CMD_PERCENT = 2;
  static final byte CMD_TORQUE = 3;
  static final float TORQUE_BOO = 520.0f;
  static final float TORQUE_MAX = 3412.0f;
  float getPedalCmd();
  void setPedalCmd(float value);
  byte getPedalCmdType();
  void setPedalCmdType(byte value);
  boolean getBooCmd();
  void setBooCmd(boolean value);
  boolean getEnable();
  void setEnable(boolean value);
  boolean getIgnore();
  void setIgnore(boolean value);
  byte getCount();
  void setCount(byte value);
}
