class Api::V1::ResourcesController < ApplicationController
  before_action :current_user
  before_action :current_boss_people, only: [:update,:create]

  def index
    resources = Resource.all_active_resources
    render json: resources
  end

  def show
    resource = Resource.find(resource_params[:id])
    render json: resource
  end

  def create
    resource = Resource.create(resource_params)
    if resource.save
      render json: resource
    else
      render json: {
        "Error": "Resource could not be created."
      }
    end
  end

  def update
    resource = Resource.find_by(id: params[:id])
    if resource
      resource.update(resource_params)
      updated_resource = Resource.find(params[:id])
      render json: updated_resource
    else
      render json: {
        "Error": "Resource does not exist in database."
      }
    end
  end

  private

    def resource_params
      params.permit(:id,
                    :resource_type_id,
                    :user_id,
                    :name,
                    :cost,
                    :created_at,
                    :updated_at,
                    :active)
    end

end
