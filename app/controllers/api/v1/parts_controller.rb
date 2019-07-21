class Api::V1::PartsController < ApplicationController
  before_action :current_user
  before_action :current_boss_people, only: [:update,:create]

  def index
    parts = Part.all
    render json: parts
  end

  def show
    part = Part.find(params[:id])
    render json: part
  end

  def create
    part = Part.new(part_params)
    if part.save
      render json: part
    else
      render json: {status: "406",
      body: {
        "error": "Unable to create your part."
        }}
    end
  end

  def update
    part = Part.find_by(id: params[:id])
    if part
      part.update(part_params)
      updated_part = Part.find(params[:id])
      render json: updated_part
    else
      render json: {
        "Error": "Part does not exist."
      }
    end
  end

  private
  def part_params
    params.permit(:name, :inventory, :active)
  end

end
