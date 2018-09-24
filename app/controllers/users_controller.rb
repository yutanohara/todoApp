class UsersController < ApplicationController
  before_action :forbid_login_user, only: %i[index, create, login, sign_up]

  def index
  end

  #GET
  def sign_in
  end

  #POST
  def login
    @user = User.find_by(user_params)
    if @user
      flash[:notice] = "success login!"
      redirect_to '/'
    end
  end

  #GET
  def sign_up
    @user = User.new
  end

  #POST
  def create
    @user = User.new(user_params)

    if @user.save
      session[:name] = @user.name
      flash[:notice] = "新規登録しました"
      UserMailer.send_confirm_to_user(@user).deliver_later
      redirect_to '/'
    else
      @error_messages = @user.errors
      render('sign_up')
    end
  end

  def logout
    session[:name] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to '/'
  end

  private

  def user_params
    params.fetch(:user, {}).permit(:name, :password, :password_confirmation, :mail)
  end
end
