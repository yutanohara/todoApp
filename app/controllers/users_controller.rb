class UsersController < ApplicationController

  #POST
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @task, status: :created
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.fetch(:user, {}).permit(:name, :password)
  end
end
