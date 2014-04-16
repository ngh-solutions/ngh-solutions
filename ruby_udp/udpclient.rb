require 'socket'

host='192.168.0.104'
port=1234
s = UDPSocket.open
#s.bind('0.0.0.0', port)
s.send("2;0", 0, host, port)

#s.bind('0.0.0.0', 1234)
#text, sender = s.recvfrom(16)
#puts text

#if(text == "world")
#s.send("OK", 0, host, port)
#end


