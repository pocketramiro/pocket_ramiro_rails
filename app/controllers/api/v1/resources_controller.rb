class Api::V1::ResourcesController < ApplicationController

  def index
    resources = Resource.all_active_resources
    render json: resources
  end

  def show
    resource = Resource.active_resource(resource_params[:id])
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
