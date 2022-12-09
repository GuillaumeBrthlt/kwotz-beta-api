class Project < ApplicationRecord
  enum status: %i[pending sent]
  belongs_to :user
  has_one :supplier_contact
  has_many :cold_rooms
end
