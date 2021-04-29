class QuestionsController < ApplicationController
  # skip_after_action :verify_authorized, only: %i[show]
  # skip_after_action :verify_policy_scoped, only: %i[index]

  def show
    @question = Question.find(params[:id])
  end

  def index
    @questions = Question.all
    # render json: questions
  end
end
