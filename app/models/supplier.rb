class Supplier < ApplicationRecord
  belongs_to :user
  has_many :supplier_contacts
  validates :alias, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :zipcode, presence: true
end
