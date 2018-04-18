
import lcm

from exlcm import example_t

log = lcm.EventLog("/log/GPS-lcm-log-2018-04-06-15:59:36", "r")

for event in log:
    if event.channel == "GPS":
        msg = example_t.decode(event.data)

        print("   timestamp   = " + msg.time)
        print("   position    = " + msg.lon)
        print("   orientation = " + msg.lat)
        print("   ranges = " + msg.lat)
