class Supplier < ApplicationRecord
  belongs_to :user
  validates :alias, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :zipcode, presence: true
end
