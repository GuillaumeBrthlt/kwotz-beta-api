class SupplierContactsController < ApplicationController
  before_action :set_supplier_contact, only: %i[ show update destroy ]
  before_action :authenticate_user!, only: %i[ new create edit update destroy ]

  # GET /supplier_contacts
  def index
    @supplier_contacts = SupplierContact.all

    render json: @supplier_contacts
  end

  # GET /supplier_contacts/1
  def show
    render json: @supplier_contact
  end

  # POST /supplier_contacts
  def create
    @supplier_contact = SupplierContact.new(supplier_contact_params)
    @supplier_contact.supplier.user == current_user

    if @supplier_contact.save
      render json: @supplier_contact, status: :created, location: @supplier_contact
    else
      render json: @supplier_contact.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /supplier_contacts/1
  def update
    if @supplier_contact.update(supplier_contact_params) && @supplier_contact.supplier.user == current_user
      render json: @supplier_contact
    else
      render json: @supplier_contact.errors, status: :unprocessable_entity
    end
  end

  # DELETE /supplier_contacts/1
  def destroy
    return unless @supplier_contact.supplier.user == current_user
    @supplier_contact.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supplier_contact
      @supplier_contact = SupplierContact.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def supplier_contact_params
      params.require(:supplier_contact).permit(:supplier_id, :first_name, :last_name, :email)
    end
end
