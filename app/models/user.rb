class User < ApplicationRecord
  has_secure_password

  validates :name,
            presence: {message: 'ログインIDを入力してください'},
            uniqueness: {message: 'このログイン名はすでに存在します'}
  validates :password,
            # presence: true,
            confirmation: {message: 'パスワードが一致しておりません'},
            length: {in: 4..30, message: '4文字以上30文字以内で入力してください'}
end
