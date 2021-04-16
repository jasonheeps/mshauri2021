class User < ApplicationRecord
  has_many :iterations, dependent: :destroy
  before_validation :insert_slug
  # after_create :send_welcome_email
  has_many :answers, through: :iterations

  # Validations for the model
  validates :slug, presence: true, uniqueness: true
  validates :email, uniqueness: { allow_blank: true }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, allow_blank: true }

  # default_scope { order(created_at: :desc) }

  def insert_slug
    self.slug ||= SecureRandom.hex
  end
end
