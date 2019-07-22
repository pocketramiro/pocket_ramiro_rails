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
    if user_params["password"] == user_params["password_confirmation"]
      @user = User.new(user_params)
      if @user.save
        render json: @user, status: 201
      elsif User.find_by(email: user_params["email"])
        render json: { error: "User already exists" },
                       status: 409
      else
        render json: { error: "Bad Request" },
                       status: 400
      end
    else
      render json: { error: "Passwords must match." },
                     status: 409
    end
  end

  def update
    binding.pry
    @user = :current_user
    if @user.update(update_params)
    # user = User.find_by(id: params[:id])
    # if user
    #   user.update(update_params)
    #   updated_user = User.find_by(id: params[:id])
      render json: @user
    else
      render json: {
        "Error": "User does not exist in database."
      }
    end
  end

  private

    def user_params
      params.permit(:id, :name, :email, :password, :password_confirmation, :role, :phone_number, :active)
    end

    def  update_params
      params.permit(:name, :phone_number, :active, :role)
    end
end
