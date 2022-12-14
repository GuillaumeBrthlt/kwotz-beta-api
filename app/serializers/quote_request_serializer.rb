class QuoteRequestSerializer
  include JSONAPI::Serializer
  attributes :email, :response_comment, :user, :user_profile, :cold_rooms, :project, :document_url
end
