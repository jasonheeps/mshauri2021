class IterationAnswersController < ApplicationController
  before_action :require_current_user

  def index
    @iteration_answers = policy_scope(IterationAnswer).where(iteration_id: params[:iteration_id])
  end

  def create
    # iteration_answers = build_iteration_answers.map { |iteration_answer| authorize iteration_answer }
    iteration_answers = authorize build_iteration_answers

# we've cheated our way through working with one answer - but the rest of the code assumes more than one answer
# maybe we should refactor what we've done so far to work for several answers
    if iteration_answers.all?(&:valid?) && iteration_answers.each(&:save!)
      render json: iteration_answers.first.answer.next_question_id
    else
      render json: iteration_answers.map(&:errors), status: :unprocessable_entity
    end
  end

  private

  def build_iteration_answers
    iteration = Iteration.find(params[:iteration_id])

    answer = Answer.find(iteration_answer_params[:iteration_answer][:answer_id])
    IterationAnswer.new(iteration: iteration, answer: answer, question: answer.question, value: answer.value)

    # iteration_answer_params[:iteration_answer].map do |a|
    #   answer = Answer.find(a[:answer_id])
    #   IterationAnswer.new(iteration: iteration, answer: answer, question: answer.question, value: a[:value])
    # end

    # abandoning the loop approach because we are expecting a hash consisting of 1 and the key value pair, but we are getting an array with the two values

    # iteration_answer = []
  #   iteration_answer_params[:iteration_answer].each do |a|
  #     answer = Answer.find(1)
  #   iteration_answer << IterationAnswer.new(iteration: iteration, answer: answer, question: answer.question, value: a[:value])
  #   end
  #   return iteration_answer
  end

  def iteration_answer_params
    params.permit(iteration_answer: %i[answer_id value])
  end
end
