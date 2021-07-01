class IterationsController < ApplicationController
  def show
    authorize @iteration = Iteration.find_by_id(params[:id])
    @recommendations = @iteration.recommendations
  end
end
