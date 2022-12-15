class QuoteRequestSerializer
  include JSONAPI::Serializer
  attributes :email, :response_status, :response_comment, :user, :user_profile, :cold_rooms, :project, :document_url, :created_at
end
