class Contact2

  attr_accessor :firstname, :lastname, :email
  attr_reader :id

  def initialize(firstname,lastname,email,id = nil)
    @firstname = firstname
    @lastname = lastname
    @email = email
    @id = id
  end

  def save
    if persisted?
      sql = "UPDATE contacts SET firstname = $1, lastname = $2, email = $3 WHERE id = $4;"
      self.class.conn.exec_params(sql, [@firstname,@lastname,@email,@id])
    else
      sql = "INSERT INTO contacts (firstname,lastname,email) VALUES ($1, $2, $3) RETURNING id;"
      result = self.class.conn.exec_params(sql, [@firstname,@lastname,@email])
      @id = result[0]["id"].to_i
    end
    true
  end

  def persisted?
    !id.nil?
  end

  def self.conn
    conn = PG.connect(
  host: 'localhost',
  dbname: 'contact_list',
  user: 'development',
  password: 'development'
  )
  end

  def self.all
    contacts =[]

    sql = "SELECT * FROM contacts;"
    conn.exec(sql) do |response|
      response.values.each { |row| contacts << Contact2.new(row[1],row[2],row[3],row[0])}
    end
    contacts.each { |obj| puts " #{obj.firstname},#{obj.lastname},#{obj.email}" }
  end

  def self.find_all_by_lastname(name)
    last_names = []
    sql = "SELECT * FROM contacts WHERE lastname = $1;"
    conn.exec(sql,[name]) do |response|
      response.values.each { |row| last_names << Contact2.new(row[1],row[2],row[3],row[0])}
    end
    last_names
  end

  def self.find_all_by_firstname(name)
    first_names = []
    sql = "SELECT * FROM contacts WHERE firstname = $1;"
    conn.exec_params(sql,[name]) do |response|
      response.values.each { |row| first_names << Contact2.new(row[1],row[2],row[3],row[0])}
    end
    first_names
  end

  def self.find_all_by_email(email)
    emails = []
    sql = "SELECT * FROM contacts WHERE email = $1;"
    conn.exec_params(sql,[email]) do |response|
      response.values.each { |row| emails << Contact2.new(row[1],row[2],row[3],row[0])}
    end
    emails
  end

  def destroy
    sql = "DELETE FROM contacts WHERE id = $1;"
    self.class.conn.exec_params(sql,[@id])
    self
  end

  def self.find(id)
    sql = "SELECT * FROM contacts WHERE id = $1;"
    conn.exec_params(sql,[id]) do |response|
      result = response.values[0]
      contact =  Contact2.new(result[1],result[2],result[3],result[0])
    end
  end

end









    # sql = "UPDATE kittens SET name  = '#{name}', WHERE id  = #{id}"
    # result = conn.exec(sql)
    # result.result_status == PG::PGRES_COMMAND_OK
