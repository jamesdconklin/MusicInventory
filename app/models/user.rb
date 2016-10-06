class User < ActiveRecord::Base
  validates :email, :password_digest, presence: true, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }
  validate :is_email?

  def self.find_by_credentials(email, pass)
    user = self.find_by(email: email)
    return nil unless user && user.is_password?(pass)
    user
  end

  def self.create_with_password(email, password)
    user = self.new(email: email)
    user.password = password
    user.save!
  end

  def is_password?(pass)
    BCrypt::Password.new(self.password_digest).is_password?(pass)
  end

  def is_email?
    unless self.email =~ /[a-zA-Z0-0]+@[a-zA-Z0-9]+\.(com|net|org|edu)/
      self.errors[:email] << 'must be a valid email address'
      return false
    end
    true
  end

  def password=(pass)
    @password = pass
    self.password_digest = BCrypt::Password.create(pass)
  end

  has_many(
    :sessions,
    class_name: :Session,
    foreign_key: :user_id,
    primary_key: :id
  )

  private

  attr_reader :password

end
