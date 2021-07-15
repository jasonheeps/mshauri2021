class AdminController < ApplicationController
  # TODO: create authorization check to verify admin user
  skip_after_action :verify_authorized, only: %i[home, login]

  def home
    fetch_iterations if params[:email]
  end

  def login
    @user = User.find_by(params[:slug])  
  end
  
  private

  def fetch_iterations
    email = params[:email]
    user = User.find_by(email: email)
    @iterations = user.iterations.sort_by(&:created_at) if user
  end
end
