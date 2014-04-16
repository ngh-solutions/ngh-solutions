#!/usr/bin/ruby

require 'rubygems'
require 'mysql'

begin
    con = Mysql.new 'localhost', 'root', 'root'

    con.list_dbs.each do |db|
        puts db
    end
    
rescue Mysql::Error => e
    puts e.errno
    puts e.error
    
ensure
    con.close if con
end
