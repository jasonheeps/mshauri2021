class ApplicationController < ActionController::Base
  include Pundit

  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index

  protected

  def current_user
    @current_user ||= User.find_by(slug: (request.headers['X-USER-SLUG'] || params[:user_slug]))
  end

  def require_current_user
    render json: { error: 'User not found' }, status: :unauthorized if current_user.blank?
  end
end
