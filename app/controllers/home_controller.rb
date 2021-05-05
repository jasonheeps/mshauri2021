class HomeController < ApplicationController
  # page rendered as root - when no user slug is given
  def welcome
    authorize @user = User.new
  end
end
