require 'user'

class Player < User
  attr_accessor :money, :username, :password, :email

  def initialize(user)
    @money = user.money
    @username = user.username
    @password = user.password
    @email = user.email
  end
end

