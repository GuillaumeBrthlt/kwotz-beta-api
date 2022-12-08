class ColdRoomsController < ApplicationController
  before_action :set_cold_room, only: %i[ show update destroy ]
  before_action :authenticate_user!
  # GET /cold_rooms
  def index
    @cold_rooms = ColdRoom.all

    render json: @cold_rooms
  end

  # GET /cold_rooms/1
  def show
    render json: @cold_room
  end

  # POST /cold_rooms
  def create
    @cold_room = ColdRoom.new(cold_room_params)

    if @cold_room.save
      render json: @cold_room, status: :created, location: @cold_room
    else
      render json: @cold_room.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cold_rooms/1
  def update
    if @cold_room.update(cold_room_params)
      render json: @cold_room
    else
      render json: @cold_room.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cold_rooms/1
  def destroy
    @cold_room.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cold_room
      @cold_room = ColdRoom.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cold_room_params
      params.require(:cold_room).permit(:name, :temperature, :condensing_unit, :prod_outside, :refrigerant_type, :length, :width, :height, :volume, :product_types, :entries_frequency, :entries_quantity, :heat_sources_power, :heat_sources, :comment, :project_id)
    end
end
