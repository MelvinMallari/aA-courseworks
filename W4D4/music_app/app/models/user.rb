class User < ApplicationRecord
  attr_reader :password

  before_validation :ensure_session_token

  validates :session_token, presence: true
  validates :password_digest, presence: { message: "Password can't be blank "}
  validates :password, length: { minimum: 6, allow_nil: true}


  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def self.find_by_credentials(email, password)
    # remember we never look people up by their password, it's not stored
    user = User.find_by(email: email)
    return nil unless user
    user.is_password?(password) ? user : nil
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  private
  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end
end
