require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/cold_rooms", type: :request do
  before(:each) do
    @user = User.create(email: "test@test.com", password: "azerty")
    @supplier = Supplier.create(user_id: @user.id, alias: "test", address: "address test", city: "city test", zipcode: "test", favorite: true)
    @supplier_contact = SupplierContact.create(supplier_id: @supplier.id, first_name: "first test", last_name: "last test", email: "test@email.fr")
    @project = Project.create(user_id: @user.id, name: "test", status: 0, message: "I am a test message", supplier_contact_id: @supplier_contact.id)
  

  # This should return the minimal set of attributes required to create a valid
  # ColdRoom. As you add validations to ColdRoom, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
      temperature: 3,
      condensing_unit: "test condensing",
      prod_outside: true,
      refrigerant_type: 5,
      length: 35,
      width: 35,
      height: 35,
      volume: 80,
      product_types: "name enterprise",
      entries_frequency: "per week",
      entries_quantity: 200,
      heat_sources_power: 35,
      heat_sources: "heat sources",
      comment: "I am a comment",
      project_id: 1
    }
  }

  let(:invalid_attributes) {
    {
      temperature: nil,
      condensing_unit: "",
      prod_outside: nil,
      refrigerant_type: nil,
      length: nil,
      width: nil,
      height: nil,
      volume: nil,
      product_types: "",
      entries_frequency: "",
      entries_quantity: nil,
      heat_sources_power: nil,
      heat_sources: "",
      comment: "",
      project_id: nil
    }
  }

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # ColdRoomsController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      ColdRoom.create! valid_attributes
      get cold_rooms_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      cold_room = ColdRoom.create! valid_attributes
      get cold_room_url(cold_room), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new ColdRoom" do
        expect {
          post cold_rooms_url,
               params: { cold_room: valid_attributes }, headers: valid_headers, as: :json
        }.to change(ColdRoom, :count).by(1)
      end

      it "renders a JSON response with the new cold_room" do
        post cold_rooms_url,
             params: { cold_room: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new ColdRoom" do
        expect {
          post cold_rooms_url,
               params: { cold_room: invalid_attributes }, as: :json
        }.to change(ColdRoom, :count).by(0)
      end

      it "renders a JSON response with errors for the new cold_room" do
        post cold_rooms_url,
             params: { cold_room: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested cold_room" do
        cold_room = ColdRoom.create! valid_attributes
        patch cold_room_url(cold_room),
              params: { cold_room: new_attributes }, headers: valid_headers, as: :json
        cold_room.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the cold_room" do
        cold_room = ColdRoom.create! valid_attributes
        patch cold_room_url(cold_room),
              params: { cold_room: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the cold_room" do
        cold_room = ColdRoom.create! valid_attributes
        patch cold_room_url(cold_room),
              params: { cold_room: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested cold_room" do
      cold_room = ColdRoom.create! valid_attributes
      expect {
        delete cold_room_url(cold_room), headers: valid_headers, as: :json
      }.to change(ColdRoom, :count).by(-1)
    end
  end
end
end