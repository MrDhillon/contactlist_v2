## TODO: Implement CSV reading/writing
require 'csv'

class ContactDatabase

  # attr_accessor :name, :email

  # @@id = 0
  # def initialize(name,email)
  #   @name = name
  #   @email = email
  #   new_entry
  # end

  def self.create(x,y,z=nil)

       id = CSV.read('contacts.csv').length + 1

        CSV.open("contacts.csv", "a") do |csv|
          # id = (csv[0] += 1)
        csv << ["#{id}","#{x}","#{y}","#{z}"]

        end

        # @@id += 1

  end

  def self.all
    # arr_of_arr = CSV.read("contacts.csv")
    arry = []

    CSV.foreach('contacts.csv') do |row|
        arry << row
    end

    return arry

  end

  def self.show
    show_arr = []

    CSV.foreach('contacts.csv') do |row|
        show_arr << row
    end
    return show_arr

  end

end






