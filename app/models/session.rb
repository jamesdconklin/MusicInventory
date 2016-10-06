class Session < ActiveRecord::Base
  validates :user, :session_token, presence: true
  validate :not_stale
  before_validation :ensure_token

  belongs_to(
    :user,
    class_name: :User,
    foreign_key: :user_id,
    primary_key: :id
  )

  def self.generate_session_token
    SecureRandom.urlsafe_base64(32)
  end

  def ensure_token
    self.session_token ||= self.class.generate_session_token
  end

  def reset!
    if not_stale
      self.touch
    else
      self.destroy
    end
  end

  def not_stale
    return true if self.updated_at.nil? ||
                   self.updated_at > 1.minutes.ago
    self.errors[:updated_at] << 'must be less than 60 minutes ago.'
    false
  end

end
