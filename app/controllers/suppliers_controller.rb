class SuppliersController < ApplicationController
  before_action :set_supplier, only: %i[ show update destroy ]

  # GET /suppliers
  def index
    @suppliers = Supplier.all

    render json: @suppliers
  end

  # GET /suppliers/1
  def show
    return unless @supplier.user == current_user
    render json: @supplier
  end

  # POST /suppliers
  def create
    @supplier = Supplier.new(supplier_params)
    @supplier.user == current_user

    if @supplier.save
      render json: @supplier, status: :created, location: @supplier
    else
      render json: @supplier.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /suppliers/1
  def update
    if @supplier.update(supplier_params) && @supplier.user == current_user
      render json: @supplier
    else
      render json: @supplier.errors, status: :unprocessable_entity
    end
  end

  # DELETE /suppliers/1
  def destroy
    return unless @supplier.user == current_user
    @supplier.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supplier
      @supplier = Supplier.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def supplier_params
      params.require(:supplier).permit(:alias, :address, :city, :zipcode, :favorite, :user_id)
    end
end
