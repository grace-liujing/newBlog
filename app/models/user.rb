class User < ActiveRecord::Base
  validates :username, :presence => true

  def password
    @password
  end

  def password=(pass)
    return unless pass
    @password = pass
    generate_password(pass)
  end

  def self.authentication(username, password)
    user = User.find_by_username(username)
    if user && Digest::SHA1.hexdigest(password + user.salt) == user.hashed_password
      return user
    end
    false
  end

  private
  def generate_password(pass)
    salt = Array.new(10){rand(1024).to_s(36)}.join
    self.salt, self.hashed_password =
        salt, Digest::SHA1.hexdigest(pass + salt)
  end
end
