class User < ApplicationRecord
  has_secure_password
  validates :name, {presence: true, uniqueness: {message: "：このログイン名はすでに存在します"}}
  validates :password,
            presence: true,
            confirmation: {message: "：パスワードが一致しておりません"},
            length: {in: 4..30}
end
