require 'rails_helper'

RSpec.describe "Successes", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/success/show"
      expect(response).to have_http_status(:success)
    end
  end

end
