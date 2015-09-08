class Phone

  attr_accessor :type, :number
  attr_reader :contact_id

  def initialize(contact_id,type,number)
    @contact_id = contact_id
    @type = type
    @number = number
  end

end