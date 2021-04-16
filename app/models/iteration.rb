class Iteration < ApplicationRecord
  belongs_to :user
  has_many :iteration_answers, dependent: :destroy
  has_many :answers, through: :iteration_answers
  has_many :questions, through: :iteration_answers
  has_many :recommendations, through: :answers
end
