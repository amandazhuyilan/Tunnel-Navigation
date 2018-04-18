#!/usr/bin/python

import Tkinter


class SimpleApp_tk(Tkinter.Tk):
    def __init__(self,parent):
        Tkinter.Tk.__init__(self,parent)
        self.parent = parent
        self.initialize()

    def initialize(self):
        self.grid()

        self.entry = Tkinter.Entry(self)
        self.entry.grid(column = 2, row = 2, sticky="EW")
        Tkinter.Label(self.entry, text = "Enter Origin: ", borderwidth=1).grid(row = 1, column = 0, sticky= "EW", ipadx = 2, ipady = 2)
        Tkinter.Label(self.entry, text = "Enter Destination: ", borderwidth=1).grid(row = 2, column = 0, ipadx = 2, ipady = 2)
        Tkinter.Label(self.entry, text= "Directions: ", borderwidth=1).grid(row = 3, column = 0, ipadx = 2, ipady = 2)

if __name__ == "__main__":
    app = SimpleApp_tk(None)
    app.title("Tunnel Navigation")
    app.mainloop()
