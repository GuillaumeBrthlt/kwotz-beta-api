class QuoteRequestsController < ApplicationController
  before_action :set_quote_request, only: %i[ show update destroy ]
  before_action :authenticate_user!, only: %i[ index create destroy ]

  # GET /quote_requests
  def index
    @quote_requests = QuoteRequest.all

    render json: QuoteRequestSerializer.new(@quote_requests).serializable_hash[:data]
  end

  # GET /quote_requests/1
  def show
    render json: QuoteRequestSerializer.new(@quote_request).serializable_hash[:data][:attributes]
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
    if @quote_request.document.attached? && quote_request_params.include?("document")
      @quote_request.document.purge
    end

    if @quote_request.update(quote_request_params)
      @quote_request.update(response_status: true)
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
      params.require(:quote_request).permit(:email, :project_id, :response_comment, document: [] )
    end
end
