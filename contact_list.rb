require 'pry'
require_relative 'contact'
require_relative 'contact_database'
# TODO: Implement command line interaction
# This should be the only file where you use puts and gets
def operation

  puts "Please input a command or type help for menu"
  input = gets.chomp.downcase.split(" ")
  string = input[0]
  number = input[1]

  if string == "help"
    puts "Here is a list of commands:
              new - Create a new contact
              list - List all contacts
              show - Show a contact
              find - Find a contact"
  end

  if string == "new"
    puts "What is the contact name?"
    name_input = gets.chomp
    puts "what is the contact email?"
    email_input = gets.chomp
    email_check = ContactDatabase.all

    if Contact.check(email_check,email_input)
      puts "email exisits"

      exit
    end

    puts "Would you like to add a number? yes or no"
input3 = gets.chomp.downcase
phone_hash = {}
while input3 == "yes"
    puts "What is the 'home' , 'work', 'office'?"
    type = gets.chomp
    puts "What is the numer?"
    number = gets.chomp
    phone_hash[type] = number
    puts "Would you like to add another number? yes or no"
    input3 = gets.chomp.downcase
    phone_hash
    binding.pry
end

    puts "Would you like to add this to your contacts file name:#{name_input} email:#{email_input}? yes or no"
    yes_no = gets.chomp.downcase

      if yes_no == "yes"
        contact = Contact.create(name_input,email_input,phone_hash)
        ContactDatabase.create(name_input,email_input,phone_hash)
      else
        puts "The information was not added"
      end
  elsif string =="list"
         list = ContactDatabase.all
         Contact.all(list)
        # puts contacts
        # contacts.each { |line| puts line.to_s }
  elsif string == "show"
        show_id = ContactDatabase.show
        Contact.show(show_id,number)
  elsif string == "find"
        find_group = ContactDatabase.show
        Contact.find(find_group,number)
  end


end


operation

