class Contact

  attr_accessor :name, :email

  def initialize(name, email,phonenumber = nil)
    # TODO: assign local variables to instance variables
    @name = name
    @email = email
    @phonenumber = phonenumber

  end

  def to_s
    # TODO: return string representation of Contact

  end

  ## Class Methods
  class << self
    def create(name, email,phonenumber)
      # TODO: Will initialize a contact as well as add it to the list of contacts
     # contact = ContactDatabase.create(@name,@email)
     Contact.new(@name,@password,@phonenumber)
    end

    def find(list,term)
      # TODO: Will find and return contacts that contain the term in the first name, last name or email
      terms = list.select {|row| row.include?(term)}
            binding.pry

      if terms.any?
        terms.each do |row|
          puts "User id: #{row[0]} Username:#{row[1]} Email: #{row[2]} Phone #{row[3]}"
        end
        return
      else
        puts "No user found"
      end
    end

    def all(list)
      # TODO: Return the list of contacts, as is
      list.each do |row|
        puts "User id: #{row[0]} Username:#{row[1]} Email: #{row[2]} Phone: #{row[3]}"
      end

    end

    def show(list,id)
      # TODO: Show a contact, based on ID
      shown_location = list.select  {|row| row[0] == id}
      if shown_location != nil
          shown_location.each do |row|
        puts "User id: #{row[0]} Username:#{row[1]} Email: #{row[2]} Phone #{row[3]}"
      end
      else
        puts "No user found"
      end
    end

    def check(list,email)
    list.each do |row|
        if row[2].downcase == email.downcase
          return true
        end
      end
      false
    end
  end
end
