class SupplierContact < ApplicationRecord
  belongs_to :supplier
  has_one :user, through: :supplier
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

end
