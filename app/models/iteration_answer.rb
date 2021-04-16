class IterationAnswer < ApplicationRecord
  # after_create :notify_completion, if: proc { |a| a.iteration.completed? }

  belongs_to :iteration
  belongs_to :question
  belongs_to :answer

  validates :question_id, uniqueness: { scope: :iteration_id }, unless: proc { |a| a.question.multiple? }

  # delegate :next_question, to: :answer

  # def notify_completion
  #   return unless iteration.completed?

  #   iteration.notify_completion
  # end
end
