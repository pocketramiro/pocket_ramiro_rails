class Api::V1::ResourcesController < ApplicationController

  def index
    resources = Resources.all_active_resources
    render json: resources
  end
end
