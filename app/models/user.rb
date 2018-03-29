# User
class User < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :password
  validates_presence_of :email
end
