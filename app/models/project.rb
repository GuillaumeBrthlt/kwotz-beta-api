class Project < ApplicationRecord
  enum :status, %i[pending sent]
  belongs_to :user
  has_one :supplier_contact
  has_one :quote_request, dependent: :destroy
  has_many :cold_rooms, dependent: :destroy
end
