class Api::V1::UsersController < ApplicationController

  def show
    user = User.find(params[:id])
    render json: user
  end

  def create
    user = User.create(user_params)
    if user.save
      render json: user
    else
      render json: {
        "Error": "User could not be created."
      }
    end
  end

  def update
    user = User.find(params[:id])
    if user
      user.update(user_params)
      updated_user = User.find(params[:id])
      render json: updated_user
    else
      render json: {
        "Error": "User does not exist in database."
      }
    end
  end

  private

    def user_params
      params.permit(:id,
                    :name,
                    :email,
                    :password_digest,
                    :role,
                    :phone_number,
                    :active,
                    :created_at,
                    :updated_at)
    end

end
