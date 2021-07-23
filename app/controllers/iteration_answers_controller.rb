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

    # iteration_answer_params[:iteration_answer].map do |a|
    #   answer = Answer.find(a[:answer_id])
    #   IterationAnswer.new(iteration: iteration, answer: answer, question: answer.question, value: a[:value])
    # end
    iteration_answer = []
    iteration_answer_params[:iteration_answer].each do |a|
      answer = Answer.find(a[:answer_id])
    iteration_answer << IterationAnswer.new(iteration: iteration, answer: answer, question: answer.question, value: a[:value])
    end
    return iteration_answer
  end

  def iteration_answer_params
    params.permit(iteration_answer: %i[answer_id value])
  end
end
