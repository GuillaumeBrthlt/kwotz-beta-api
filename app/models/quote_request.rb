class QuoteRequest < ApplicationRecord
  belongs_to :project
  has_one :user, through: :project
  has_one :user_profile, through: :user
  has_many :cold_rooms, through: :project
end
