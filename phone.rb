class Phonenumber < ActiveRecord::Base

  belongs_to :contact
  validates :kind, presence: true
  validates :phone, presence: true

  def to_s
    "#{kind}: #{phone}"
  end

end