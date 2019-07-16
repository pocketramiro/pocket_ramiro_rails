class Api::V1::ResourceTypesController < ApplicationController

  def index
    resources = ResourceType.all_active_resource_types
    render json: resources
  end

  def show
    resource = ResourceType.active_resource_type(resource_type_params[:id])
    render json: resource
  end

  def create
    resource = ResourceType.create(resource_type_params)
    if resource.save
      render json: resource
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
