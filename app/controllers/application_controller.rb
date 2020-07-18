class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to users_path
    end
  end

  def require_same_user
    if current_user != @user and !current_user.admin?
      flash[:error] = "not allowed to perform that action"
      redirect_to users_path
    end
  end
  def require_admin
    if !current_user.admin?
      flash[:error] = "only admins can perform that action"
      redirect_to courses_path
    end
  end
  
  def require_course_admin
    if !current_user.teacher? and !current_user.admin?
      flash[:error] = "you cant perform that action"
      redirect_to courses_path
    end
  end
end
