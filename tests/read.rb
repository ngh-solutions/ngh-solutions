File.open("config.txt","r").each_line do |line|
data = line.split(/\t/)
src,dst,func = data.map{|d| d.split(";") }.flatten

puts src,dst,func
end


