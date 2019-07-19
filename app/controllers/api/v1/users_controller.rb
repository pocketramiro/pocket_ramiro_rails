class Api::V1::UsersController < ApplicationController

  def index
    users = User.all
    render json: users
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: {
        "Error": "User could not be created. You need a minimum of a unique email, a name and password to create a user account."
      }
    end
  end

  def update
    user = User.find_by(id: params[:id])
    if user
      user.update(user_params)
      updated_user = User.find_by(id: params[:id])
      render json: updated_user
    else
      render json: {
        "Error": "User does not exist in database."
      }
    end
  end

  private

    def user_params
      params.permit(:status,
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
