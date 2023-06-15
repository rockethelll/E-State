class EstatesController < ApplicationController
  before_action :set_estate, only: %i[show update destroy]
  before_action :authenticate_user!, only: %i[create update destroy]

  def index
    @estates = Estate.all

    render json: @estates
  end

  def show
    render json: @estate
  end

  def create
    @estate = Estate.new(estate_params)
    @estate.user = current_user

    if @estate.save
      render json: @estate, status: :created, location: @estate
    else
      render json: @estate.errors, status: :unprocessable_entity
    end
  end

  def update
    if @estate.update(estate_params)
      render json: @estate
    else
      render json: @estate.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @estate.destroy
  end

  private

  def set_estate
    @estate = Estate.find(params[:id])
  end

  def estate_params
    params.require(:estate).permit(:title, :price, :description, :area, :rooms, :furnished)
  end
end
