class User < ActiveRecord::Base
  has_many :comments
  has_many :votes

  validates_presence_of :username, :password
  validates_uniqueness_of :username

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  def authenticate?(password_attempt)
    self.password == password_attempt
  end
end
