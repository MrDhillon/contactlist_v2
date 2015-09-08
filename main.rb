require './contact2'
require 'pg'
require 'pry'

mike = Contact2.new('mike','haze','mikey@email.com')

class Application

  def self.run

    arg = ARGV[0]

    case arg
    when "help"
    puts "Here is a list of commands:
            new - Create a new contact
            delete - Delete a contact
            lastname - Contacts with that lastname
            firstname - Contacts with that firstname
            show - Show a contact
            find - Find a contact by id
            list - list all contacts"
    when "new"
      puts "What is the first name?"
      fname = $stdin.gets.chomp.downcase
      puts "What is the last name?"
      lname = $stdin.gets.chomp.downcase
      puts "What is the email?"
      email = $stdin.gets.chomp.downcase
      if Contact2.find_all_by_email(email) == []
        puts "Would you like to add a number?"
        pnum = $stdin.gets.chomp.downcase
          if pnum == "yes"
            while pnum == "yes"
              puts "what type of number do you have? WORK HOME MOBILE"
              type = $stdin.gets.chomp
              puts "What is the number?"
              number = $stdin.gets.chomp
              puts "would you like to add another number?"
              pnum = $stdin.gets.chomp
            end
          else
            contact = Contact2.new(fname,lname,email)
            contact.save
            puts "Contact created with id: #{contact.id}"
          end
      else
        puts "Contact already exists"
      end
    when "delete"
    when "lastname"
      puts "What is the First name that you want to display?"
      last_name = $stdin.gets.chomp.downcase
      Contact2.find_all_by_lastname(last_name)
    when "list"
      Contact2.all
    when "firstname"
      puts "What is the First name that you want to display?"
      first_name = $stdin.gets.chomp.downcase
      Contact2.find_all_by_firstname(first_name)
    end
  end
end

Application.run
