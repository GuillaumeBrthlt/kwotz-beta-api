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

RSpec.describe "/suppliers", type: :request do
    before(:each) do
      @user = User.create(email: 'test@mail.com', password: 'azerty')
    # This should return the minimal set of attributes required to create a valid
    # Supplier. As you add validations to Supplier, be sure to
    # adjust the attributes here as well.
    let(:valid_attributes) {
      {
        alias: 'enterprise',
        address: '2 boulevard Cimiez',
        city: 'Toulouse',
        zipcode: '31000',
        favorite: true,
        user_id: 1
      }
    }

    let(:invalid_attributes) {
      {
      alias: '',
      address: '',
      city: '',
      zipcode: 31000,
      favorite: nil,
      user_id: nil
      }
      
    }

    # This should return the minimal set of values that should be in the headers
    # in order to pass any filters (e.g. authentication) defined in
    # SuppliersController, or in your router and rack
    # middleware. Be sure to keep this updated too.
    let(:valid_headers) {
      {}
    }

    describe "GET /index" do
      it "renders a successful response" do
        Supplier.create! valid_attributes
        get suppliers_url, headers: valid_headers, as: :json
        expect(response).to be_successful
      end
    end

    describe "GET /show" do
      it "renders a successful response" do
        supplier = Supplier.create! valid_attributes
        get supplier_url(supplier), as: :json
        expect(response).to be_successful
      end
    end

    describe "POST /create" do
      context "with valid parameters" do
        it "creates a new Supplier" do
          expect {
            post suppliers_url,
                params: { supplier: valid_attributes }, headers: valid_headers, as: :json
          }.to change(Supplier, :count).by(1)
        end

        it "renders a JSON response with the new supplier" do
          post suppliers_url,
              params: { supplier: valid_attributes }, headers: valid_headers, as: :json
          expect(response).to have_http_status(:created)
          expect(response.content_type).to match(a_string_including("application/json"))
        end
      end

      context "with invalid parameters" do
        it "does not create a new Supplier" do
          expect {
            post suppliers_url,
                params: { supplier: invalid_attributes }, as: :json
          }.to change(Supplier, :count).by(0)
        end

        it "renders a JSON response with errors for the new supplier" do
          post suppliers_url,
              params: { supplier: invalid_attributes }, headers: valid_headers, as: :json
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

        it "updates the requested supplier" do
          supplier = Supplier.create! valid_attributes
          patch supplier_url(supplier),
                params: { supplier: new_attributes }, headers: valid_headers, as: :json
          supplier.reload
          skip("Add assertions for updated state")
        end

        it "renders a JSON response with the supplier" do
          supplier = Supplier.create! valid_attributes
          patch supplier_url(supplier),
                params: { supplier: new_attributes }, headers: valid_headers, as: :json
          expect(response).to have_http_status(:ok)
          expect(response.content_type).to match(a_string_including("application/json"))
        end
      end

      context "with invalid parameters" do
        it "renders a JSON response with errors for the supplier" do
          supplier = Supplier.create! valid_attributes
          patch supplier_url(supplier),
                params: { supplier: invalid_attributes }, headers: valid_headers, as: :json
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.content_type).to match(a_string_including("application/json"))
        end
      end
    end

    describe "DELETE /destroy" do
      it "destroys the requested supplier" do
        supplier = Supplier.create! valid_attributes
        expect {
          delete supplier_url(supplier), headers: valid_headers, as: :json
        }.to change(Supplier, :count).by(-1)
      end
    end
  end
end