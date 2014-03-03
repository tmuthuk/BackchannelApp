class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  helper_method :admin_user

  def current_user
    # Note: we want to use "find_by_id" because it's OK to return a nil.
    # If we were to use User.find, it would throw an exception if the user can't be found.
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]

  end

  def admin_user
    if current_user.nil? || !current_user.is_admin?
      flash[:error] = 'You do not have permission to access that page.'
      redirect_to :root
    end
  end

  def authenticate_user
    if current_user.nil?
      flash[:error] = 'You must be signed in to view that page.'
      redirect_to :root
    end
  end

  def isanonymous
    @user = User.all
    @username = @user.username
  end

  #private
  #def current_user
   # @current_user ||= User.find(session[:user_id]) if session[:user_id]
  #end
  #helper_method :current_user
end
