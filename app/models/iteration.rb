class Iteration < ApplicationRecord
  belongs_to :user
  has_many :iteration_answers, dependent: :destroy
  has_many :answers, through: :iteration_answers
  has_many :questions, through: :iteration_answers
  has_many :recommendations, through: :answers

  # This method will return the first question in case the
  # the iteration has no answer yet and then return the last answer's next question in
  # case the iteration has answers
  def starting_question_id
    return iteration_answers.last.answer.next_question_id if iteration_answers.any?

    Question.find_by(identifier: '1').id
  end
end
