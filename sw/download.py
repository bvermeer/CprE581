# sensor.py
#
# Write everything from the serial port to a file. 
#

import serial
import time
import re
import sys
from time import sleep
import signal
import struct 

baudrate=115200;




if len(sys.argv) < 3:
	print "usage: download.py output_file_name ser_port\n"	
	sys.exit(0)

filename = sys.argv[1];
PortName = sys.argv[2];
ser = None
f = None

def shutdown():
	ser.close()
        f.close()
	sys.exit()

def signal_handler(signal, frame):
	shutdown()


print "Opening '"+PortName+"' at "+str(baudrate)+" bps ...\n"
ser = serial.Serial(PortName,baudrate, timeout=None)
print "Port opened.\n"

signal.signal(signal.SIGINT, signal_handler)


## Open the file with read only permit
out = open(filename,"w")
size= (ser.read(4)) #size
print "Got length: "+size;


## If the file is not empty keep reading line one at a time
## till the file is empty
try:
	for i in range(0,size):

		bword= (ser.read(8)) #blocking forever
		aword= struct.unpack('<Q',str(bword))
		print ':'.join(x.encode('hex') for x in aword)
		out.write(bword)	

except Exception, e:
   	print e.__doc__
   	print e.message
	shutdown()
	
out.close()	
shutdown()


