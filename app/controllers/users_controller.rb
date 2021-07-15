class UsersController < ApplicationController
  # skip pundit authorization for UsersController
  skip_after_action :verify_authorized

  def create
    if user_params[:email].blank?
      flash[:notice] = 'Please enter your email address'
      redirect_to root_url
    else
      login or register
    end
  end

  private

  def login
    # user can only login if they entered an email
    # user can only login if they already have an "account"
    @user = User.find_by(email: user_params[:email])
    return false unless @user

    # if user entered an email for which an "account" already exists, then:
    # resend email with login info
    # - resend email with login info
    UserMailer.with(user: @user).login.deliver_now
    # - display flash notice
    flash[:notice] = 'Welcome back. Please use the link in the email to access your recommendations'
    # - stay on home#welcome
    if @user.admin
      redirect_to admin_login_path(@user.slug)
    else
      redirect_to root_url
    end   
  end

  def register
    @user = User.new(user_params)
    if @user.save && @user.iterations.build.save # TODO: refactor iteration creation and redirect to iteration
      if @user.admin
        redirect_to admin_login_path(@user.slug)
      else
        redirect_to iteration_question_url(
          user_slug: @user.slug,
          iteration_id: @user.iterations.last.id,
          question_id: @user.iterations.last.starting_question_id
        )
      end
    else
      render '/home/welcome'
    end
  end

  def user_params
    params.require(:user).permit(:email, :name)
  end
end
