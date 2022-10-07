module Authentication
  extend ActiveSupport::Concern

  included do
    helper_method :current_user
    rescue_from UserNotAuthenticated, with: :user_not_authenticated!
  end

  class UserNotAuthenticated < StandardError; end

  def current_user
    @current_user = @current_user || User.find_by(id: session[:current_user_id])
  end

  def logged_in?
    if @current_user.present?
  end

  def authenticate_current_user!
    return if current_user.present?

    raise UserNotAuthenticated, "No current_user_id in session."
  end

  private
    def user_not_authenticated!
      redirect_to new_session_path, alert: "You must log in first."
    end
end
