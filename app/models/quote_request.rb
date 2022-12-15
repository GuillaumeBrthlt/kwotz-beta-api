class QuoteRequest < ApplicationRecord
  belongs_to :project
  has_one :user, through: :project
  has_one :user_profile, through: :user
  has_many_attached :document, dependent: :destroy
  has_many :cold_rooms, through: :project
  after_create :send_mail
  after_update :mail_document
  after_create :update_project

  def update_project
    self.project.sent!
  end

  def send_mail
    QuoteRequestMailer.quote_request_send(self).deliver_now
  end

  def mail_document
    if document.attached?
      user = self.user
      QuoteRequestMailer.document_attached_send(user, self).deliver_now
    end
  end

  def document_url
    if document.attached?
      document.each_with_object([]) do |doc, array|
        array<<Rails.application.routes.url_helpers.url_for(doc)
      end
    end
  end
end
