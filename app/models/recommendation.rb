class Recommendation < ApplicationRecord
  has_many :answers, dependent: :nullify
  has_many :iteration_answers, through: :answers
  has_many :iterations, through: :iteration_answers

  validates :title, :description, :identifier, presence: true
  validates :identifier, uniqueness: true

  # scope :general, -> { where(general: true) }
end
