class Project < ApplicationRecord
  enum status: %i[pending sent]
  belongs_to :user
  belongs_to :supplier_contact
  has_many :cold_rooms
end
