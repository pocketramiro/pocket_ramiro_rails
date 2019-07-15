class Api::V1::ResourcesController < ApplicationController

  def index
    resources = Resource.all_active_resources
    render json: resources
  end

  def show
    resource = Resource.active_resource(resource_params[:id])
    render json: resource
  end


  private

    def resource_params
      params.permit(:id)
    end
end
