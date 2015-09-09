# mike = Contact2.new('mike','haze','mikey@email.com')
require_relative 'contact2'
require_relative 'phone'
require 'awesome_print'
class Application

  def self.app

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
      contact_new = Contact.new(firstname: fname, lastname: lname, email: email)
      unless contact_new.save
        ap "Email already exists"
      end
      puts "Contact with email: #{email} saved to database with id: #{contact_new.id}"
      puts "Would you like to add a number?"
      pnum = $stdin.gets.chomp.downcase
        if pnum == "yes"
          while pnum == "yes"
              puts "what type of number do you have? WORK HOME MOBILE"
              typee = $stdin.gets.chomp
              puts "What is the number?"
              number = $stdin.gets.chomp
              contact_new.phonenumbers.create(kind: typee, phone: number)
              puts "would you like to add another number?"
              pnum = $stdin.gets.chomp
            end
          else
            contact = Contact.new(fname,lname,email)
            contact.save
            puts "Contact created with id: #{contact.id}"
        end
    when "delete"
      self.destroy
    when "lastname"
      puts "What is the last name that you want to display?"
      last_name = $stdin.gets.chomp.downcase
      ap Contact.where(lastname: last_name)
    when "list"
      ap Contact.all
    when "firstname"
      puts "What is the First name that you want to display?"
      first_name = $stdin.gets.chomp.downcase
      ap Contact.where(firstname: first_name)
    end
  end
end
