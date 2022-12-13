class QuoteRequestsController < ApplicationController
  before_action :set_quote_request, only: %i[ show update destroy ]
  before_action :authenticate_user!, only: %i[ index create update destroy ]

  # GET /quote_requests
  def index
    @quote_requests = QuoteRequest.all

    render json: @quote_requests, :include => [:user, :user_profile, :cold_rooms, :project]
  end

  # GET /quote_requests/1
  def show
    render json: @quote_request, :include => [:user, :user_profile, :cold_rooms, :project]
  end

  # POST /quote_requests
  def create
    @quote_request = QuoteRequest.new(quote_request_params)

    if @quote_request.save
      render json: @quote_request, status: :created, location: @quote_request
    else
      render json: @quote_request.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /quote_requests/1
  def update
    if @quote_request.update(quote_request_params)
      render json: @quote_request
    else
      render json: @quote_request.errors, status: :unprocessable_entity
    end
  end

  # DELETE /quote_requests/1
  def destroy
    @quote_request.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quote_request
      @quote_request = QuoteRequest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def quote_request_params
      params.require(:quote_request).permit(:email, :project_id, :document, :response_comment, :response_status)
    end
end
