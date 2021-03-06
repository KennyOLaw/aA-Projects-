class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true 
  validates :password, length: {minimum: 6, allow_nil: true}
  validates :passwrd_digest, presence: true
  validates :session_token, presence: true, uniqueness: true 

  attr_reader :password

  after_initialize :ensure_session_token
  
  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)

    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end 

  def password=(password)
    @password = password
    self.passwrd_digest = BCrypt::Password.create(password)
  end 

  def is_password?(password)
    BCrypt::Password.new(self.passwrd_digest).is_password?(password)
  end 

  def reset_session_token!
    self.session_token = self.generate_session_token
    self.save!
    self.session_toke
  end 
  
  private 
  
  def self.generate_session_token
    SecureRandom.urlsafe_base64(16)
  end 
  
  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end 
end 