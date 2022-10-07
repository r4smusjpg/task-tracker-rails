class UsersController < ApplicationController
  before_action :authenticate_current_user!, only: %i[show edit update]
  skip_after_action :verify_authorized

  def show
  end

  def new
    redirect_to profile_path if current_user.present?
    @user = User.new
  end

  def edit
  end

  def create
    redirect_to profile_path if current_user.present?
    @user = User.new(users_params)

    if @user.save
      redirect_to projects_path, notice: "You have successfully signed up."
      session[:current_user_id] = @user.id
    else
      render :new
    end
  end

  def update
    if current_user.update(users_params)
      redirect_to '/profile', notice: 'Your profile was successfully updated.'
    else
      render :edit
    end
  end

  private
  
    def users_params
      params.require(:user).permit(:email, :full_name, :password)
    end
end
