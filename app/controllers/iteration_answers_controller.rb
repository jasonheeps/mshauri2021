class IterationAnswersController < ApplicationController
  before_action :require_current_user

  def index
    @iteration_answers = policy_scope(IterationAnswer).where(iteration_id: params[:iteration_id])
  end

  def create
    iteration_answers = build_iteration_answers.map { |iteration_answer| authorize iteration_answer }

    if iteration_answers.all?(&:valid?) && iteration_answers.each(&:save!)
      render json: iteration_answers.first.answer.next_question_id
    else
      render json: iteration_answers.map(&:errors), status: :unprocessable_entity
    end
  end

  private

  def build_iteration_answers
    iteration = Iteration.find(params[:iteration_id])

    iteration_answer_params[:answers].map do |a|
      answer = Answer.find(a[:answer_id])
      IterationAnswer.new(iteration: iteration, answer: answer, question: answer.question, value: a[:value])
    end
  end

  def iteration_answer_params
    params.permit(answers: %i[answer_id value])
  end
end
