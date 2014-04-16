#!/usr/bin/ruby

#Programm aufrufen mit Quelladresse und Funktion durch Semikolon getrennt aufrufen
#Beispiel: ruby read_db.rb 192.168.0.2;2
#Ausgabe sind alle Datensätze mit dieser Kombination, damit können auch mehrere Senken von einer Quelle ausgewählt werden

require 'socket'
require 'rubygems'
require 'mysql'

s = UDPSocket.new
s.bind('0.0.0.0', 1234)

text=''

while(true)
  text, sender = s.recvfrom(16)
  src = sender[3]
  func, value = text.split(";")
puts func, value

begin
  
    con = Mysql.new 'localhost', 'root', 'root', 'IQHome'

    rs = con.query("SELECT * FROM functions WHERE SRC = \"#{src}\" AND FUNC=\"#{func}\"")
puts "Done"
    n_rows = rs.num_rows
    
    puts "There are #{n_rows} rows in the result set"
    
    n_rows.times do
        puts rs.fetch_row.join("\s")
    end
 
rescue Mysql::Error => e
    puts e.errno
    puts e.error
    
ensure
    con.close if con
end
end
