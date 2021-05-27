class HomeController < ApplicationController
  # page rendered as root - when no user slug is given
  def welcome
    @user = User.new

    # skip pundit authorization for home#welcome
    skip_authorization
  end

  def index
    @user = User.find_by(slug: params[:user_slug])
    redirect_to recommendations_path(
      user_slug: @user.slug,
      iteration_id: @user.iterations.last.id
    )
    authorize @user = User.new
  end
end
