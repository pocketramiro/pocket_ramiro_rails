class Api::V1::Resources::PartsController < ApplicationController
  before_action :current_user
  before_action :current_boss_people, only: [:update,:create]

  def index
    parts = Part.parts_by_resource(params[:resource_id])
    render json: parts
  end

  def show
    part = Part.find_by(id: params[:id])
    render json: part
  end

  def create
    part = Part.create(part_params)
      r_part = ResourcePart.new(resource_id: params["resource_id"], part_id: part.id)
      if part.save && r_part.save
        render json: part
    else
      render json: {status: "406",
        body: {
        "Error": "Unable to create your part."
      }}
    end
  end

  def update
    part = Part.find_by(id: params[:id])
    if part
      part.update(part_params)
      updated_part = Part.find_by(id: params[:id])
      render json: updated_part
    else
      render json: {
        "Error": "Part does not exist in the database."
      }
    end
  end

  private
    def part_params
      params.permit(:name, :inventory, :active)
    end
end
