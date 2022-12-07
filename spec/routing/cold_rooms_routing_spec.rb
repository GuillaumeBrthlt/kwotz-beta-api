require "rails_helper"

RSpec.describe ColdRoomsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/cold_rooms").to route_to("cold_rooms#index")
    end

    it "routes to #show" do
      expect(get: "/cold_rooms/1").to route_to("cold_rooms#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/cold_rooms").to route_to("cold_rooms#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/cold_rooms/1").to route_to("cold_rooms#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/cold_rooms/1").to route_to("cold_rooms#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/cold_rooms/1").to route_to("cold_rooms#destroy", id: "1")
    end
  end
end
