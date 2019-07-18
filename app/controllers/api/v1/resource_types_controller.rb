class Api::V1::ResourceTypesController < ApplicationController

  def index
    resource_types = ResourceType.all_active_resource_types
    render json: resource_types
  end

  def show
    resource_type = ResourceType.find(resource_type_params[:id])
    render json: resource_type
  end

  def create
    resource_type = ResourceType.create(resource_type_params)
    if resource_type.save
      render json: resource_type
    else
      render json: {
        "Error": "Resource type could not be created."
      }
    end
  end

  def update
    resource_type = ResourceType.find_by(id: params[:id])
    if resource_type
      resource_type.update(resource_type_params)
      updated_resource = ResourceType.find(params[:id])
      render json: updated_resource
    else
      render json: {
        "Error": "Resource type does not exist."
      }
    end
  end

  private

    def resource_type_params
      params.permit(:id,
                    :category,
                    :company,
                    :contact_name,
                    :contact_number,
                    :manual_url,
                    :created_at,
                    :updated_at,
                    :active)
    end

end
