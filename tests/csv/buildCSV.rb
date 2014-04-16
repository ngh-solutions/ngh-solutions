#!/usr/bin/env ruby
require 'csv'
articles = [
  [
    'Perrin',
    'Chad',
    'Einfache Datenspeicherung mit Ruby',
    'Programmieren'
  ],
  [
    'Perrin',
    'Chad',
    'Besprechung: Das beste Linuxbuch überhaupt',
    'Open Source'
  ],
  [
    'Perrin',
    'Chad',
    'NetworkManager, der fünfte Reiter der Apocalinux',
    'Open Source'
  ]
]
CSV.open('articles.csv', 'w') do |csv|
articles.each {|record| csv << record }
end
