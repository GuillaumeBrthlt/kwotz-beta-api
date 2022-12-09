require "rails_helper"

RSpec.describe QuoteRequestsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/quote_requests").to route_to("quote_requests#index")
    end

    it "routes to #show" do
      expect(get: "/quote_requests/1").to route_to("quote_requests#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/quote_requests").to route_to("quote_requests#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/quote_requests/1").to route_to("quote_requests#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/quote_requests/1").to route_to("quote_requests#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/quote_requests/1").to route_to("quote_requests#destroy", id: "1")
    end
  end
end
