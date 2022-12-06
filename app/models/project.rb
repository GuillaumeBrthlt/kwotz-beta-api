class Project < ApplicationRecord
  enum status: %i[pending sent]
  belongs_to :user
  belongs_to :supplier_contact
  has_many :cold_rooms
  validates :user_id, presence: true
  validates :name, presence: true
  validates :status, presence: true 
  validates :message, presence: true 
  validates :supplier_contact_id, presence: true
end
