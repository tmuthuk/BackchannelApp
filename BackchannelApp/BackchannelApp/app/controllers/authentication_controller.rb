class AuthenticationController < ApplicationController
  before_filter :authenticate_user, :only => [:account_settings, :set_account_info]
  def sign_in
    @user = User.new
  end

  def login
    username_or_email = params[:user][:username]
    password = params[:user][:password]

    if username_or_email.rindex('@')
      email=username_or_email
      user = User.authenticate_by_email(email, password)
    else
      username=username_or_email
      user = User.authenticate_by_username(username, password)
    end

    if user
      session[:user_id] = user.id
      session[:user_name] = user.username
      flash[:notice] = 'Welcome.'
      redirect_to :controller => "posts" , :action =>"index"
    else
      flash.now[:error] = 'Unknown user. Please check your username and password.'
      render :action => "sign_in"
    end

  end

  def signed_out
    session[:user_id] = nil
    session[:user_name] = nil
    flash[:notice] = "You have been signed out."
    redirect_to :root
  end

  def new_user
    @user = User.new
  end

  def register
    @user = User.new(params[:user])

    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      session[:user_name] = @user.username
      flash[:notice] = 'Welcome! You have successfully signed up for a new account!'
      #redirect_to :root
      redirect_to :controller => "posts"
    else
      render :action => "new_user"
    end
  end

  def account_settings
    @user = current_user
  end

  def set_account_info
    old_user = current_user

    # verify the current password by creating a new user record.
    @user = User.authenticate_by_username(old_user.username, params[:user][:password])

    # verify
    if @user.nil?
      @user = current_user
      @user.errors[:password] = "Password is incorrect."
      render :action => "account_settings"
    else
      # update the user with any new username and email
      # update method wouldn't work. Use update_attributes
      @user.update_attributes(params[:user])
      # Set the old email and username, which is validated only if it has changed.
      # Set the old email and username which is the previous_email and previous_username from the old session variable
      @user.previous_email = old_user.email
      @user.previous_username = old_user.username

      if @user.valid?
        # If there is a new_password value, then we need to update the password.
        @user.password = @user.new_password unless @user.new_password.nil? || @user.new_password.empty?
        @user.save
        flash[:notice] = 'Account settings have been changed.'
        redirect_to :root
      else
        render :action => "account_settings"
      end
    end
  end
end