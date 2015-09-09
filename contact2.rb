class Contact < ActiveRecord::Base

  has_many :phonenumbers
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true, uniqueness: true

end









    # sql = "UPDATE kittens SET name  = '#{name}', WHERE id  = #{id}"
    # result = conn.exec(sql)
    # result.result_status == PG::PGRES_COMMAND_OK
