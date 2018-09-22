class UsersController < ApplicationController

  def login
    @user = User.find_by(user_params)
    if @user
      flash[:notice] = "success login!"
      redirect_to '/'
    end
  end

  #POST
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.fetch(:user, {}).permit(:name, :password, :password_confirmation)
  end
end
