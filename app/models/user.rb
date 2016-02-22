
require 'bcrypt'

class User < ActiveRecord::Base
  # users.password_hash in the database is a :string
  has_many :books, dependent: :destroy
  has_many :adds
  include BCrypt

  

  #def password
  #  @password ||= Password.new(password_hash)
  #end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(passw)
    if password == passw
      true
    else
      puts "wttttatatatatat"
      false
    end
  end
end
