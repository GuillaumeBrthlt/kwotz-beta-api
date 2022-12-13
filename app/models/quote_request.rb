class QuoteRequest < ApplicationRecord
  belongs_to :project
  has_one :user, through: :project, dependent: :destroy
  has_one :user_profile, through: :user, dependent: :destroy
  has_one_attached :document, dependent: :destroy
  has_many :cold_rooms, through: :project, dependent: :delete_all
  after_create :send_mail
  after_create :update_project

  def update_project
    self.project.sent!
  end

  def send_mail
    user = self.user
    QuoteRequestMailer.quote_request_send(user, self).deliver_now
  end

end
