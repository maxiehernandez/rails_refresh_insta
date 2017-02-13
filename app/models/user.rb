class User < ApplicationRecord
  has_secure_password
  has_many :post
  has_many :comments
end
