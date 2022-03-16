class User < ActiveRecord::Base
  has_secure_password

  # validates :name, presence: true
  # validates :price, presence: true
  # validates :quantity, presence: true
  # validates :category, presence: true

  validates :email, presence: true, uniqueness: { case_sensitive: false}
  validates :password, presence: true, confirmation: true, length: {minimum: 6}

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip.downcase)
    if(user && user.authenticate(password))
      return user
    end
    return nil
  end
end
