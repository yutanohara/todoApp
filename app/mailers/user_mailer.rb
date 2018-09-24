class UserMailer < ApplicationMailer
  def send_confirm_to_user(user)
    @user = user
    mail to: @user.mail,
         subject: '会員登録しました'
  end
end