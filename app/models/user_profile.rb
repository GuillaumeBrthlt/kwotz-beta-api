class UserProfile < ApplicationRecord
  belongs_to :user, dependent: :destroy
  validates :user_id, presence: true
  validates :company, presence: true
  validates :address, presence: true
  validates :zipcode, presence: true
  validates :city, presence: true
  validates :role, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :shipping_alias, presence: true
  validates :shipping_address, presence: true
  validates :shipping_zipcode, presence: true
  validates :shipping_city, presence: true
end
