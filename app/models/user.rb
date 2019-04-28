class User < ApplicationRecord
  has_secure_password
  before_create :create_activation_token
  attr_accessor :activation_token
  has_many :problems
  mount_uploader :avatar, AvatarUploader
  validates :name, presence: true, length: {maximum: 30}, uniqueness: {case_sensitive: true}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
            format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: 6}

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  def authorized?(activation_token)
    BCrypt::Password.new(activation_digest).is_password?(activation_token)
  end

  def activate
    update_columns(activated: true, activated_at: Time.zone.now)
  end

  private

  def create_activation_token
    self.activation_token = User.new_token
    self.activation_digest = User.digest(activation_token)
  end
end
