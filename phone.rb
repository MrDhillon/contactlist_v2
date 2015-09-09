class Phonenumber < ActiveRecord::Base

  belongs_to :store
  validates :kind, presence: true
  validates :phone, presence: true

end