require './contact2'
require 'pg'
require 'pry'

mike = Contact2.new('mike','haze','mikey@email.com')

mike.save
mike.save
puts Contact2.find_all_by_lastname("haze")
puts Contact2.find_all_by_firstname("robert")
puts Contact2.find_all_by_email("mikey@email.com")
Contact2.all
