class UsersController < ApplicationController
  before_action :forbid_login_user, only: %i[index, create, login]

  def index
  end

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
      flash[:notice] = "新規登録しました"
      render json: @user, status: :created
    else
      @error_messages = @user.errors
      render('index')
    end
  end

  private

  def user_params
    params.fetch(:user, {}).permit(:name, :password, :password_confirmation)
  end
end
