class User
  attr_accessor :money, :username, :password, :email
  
  def initialize(username, password, email)
    @username = username
    @password = password
    @email = email
    @money = 100
  end
end
