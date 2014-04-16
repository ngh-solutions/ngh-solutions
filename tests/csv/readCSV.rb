#!/usr/bin/env ruby
require 'csv'
articles = Array.new

CSV.foreach('articles.csv') do |record|
articles << record
end

puts articles[0][1]
