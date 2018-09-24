class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :current_user

  def current_user
    @current_user ||= User.find_by(name: session[:name])
  end

  def authenticate_user
    if @current_user == nil
      flash[:notice] = 'ログインが必要です'
      redirect_to('/sign_in')
    end
  end

  def forbid_login_user
    if @current_user
      flash[:notice] = 'すでにログインしています'
      redirect_to('/')
    end
  end
end
