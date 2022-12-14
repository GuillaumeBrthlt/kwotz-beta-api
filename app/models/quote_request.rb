class QuoteRequest < ApplicationRecord
  belongs_to :project
  has_one :user, through: :project
  has_one :user_profile, through: :user
  has_many_attached :document, dependent: :destroy
  has_many :cold_rooms, through: :project
  after_create :send_mail
  after_create :update_project

  def update_project
    self.project.sent!
  end

  def send_mail
    user = self.user
    QuoteRequestMailer.quote_request_send(user, self).deliver_now
  end

  def document_url
    if document.attached?
      document.each_with_object([]) do |doc, array|
        array<<Rails.application.routes.url_helpers.url_for(doc)
      end
    end
  end
end
