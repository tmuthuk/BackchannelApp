class AdminController < ApplicationController
  before_filter :admin_user, :only => [:list_admin_panel, :promote_user, :demote_user, :delete_user]

  def list_admin_panel
    @user = User.all
  end

  def promote_user
    @user = User.find(params[:user_id])
    #flash[:notice] = @user.username
    if @user.update_attributes(:admin => true)
      flash[:notice] = "Successfully promoted to admin"
    else
      flash[:error] = "Promoting user to admin was unsuccessful"
    end
    redirect_to :action => "list_admin_panel"
    #redirect_to :root
  end

  def demote_user
    @user = User.find(params[:user_id])
    if(@user.is_superadmin?)
      flash[:error] = "Cannot revoke admin privileges of super admin"
    else
      if @user.update_attributes(:admin => false)
        flash[:notice] = "Successfully revoked admin privileges"
      else
        flash[:error] = "Could not revoke admin privileges"
      end
    end
    redirect_to :action => "list_admin_panel"
    #redirect_to :root
  end

  def delete_user
    @user = User.find(params[:user_id])
    if(@user.is_superadmin?)
      flash[:error] = "Cannot delete super admin."
    elsif (@user.is_admin? && @user!=current_user)
      flash[:error] = "Cannot delete other admins."
    else
      #flash[:notice] = @user.username
      if @user.destroy
        flash[:notice] = "User successfully deleted"
      else
        flash[:error] = "Could not delete user. Please try again"
      end
    end
    redirect_to :action => "list_admin_panel"
    #redirect_to :root
  end

  def reports
    days_before = params[:days]
    if days_before.nil?
      @post = Post.all
      puts "I am here"
    else

      posts = Post.all
      @post = posts.reject{|post| post.created_at < days_before.to_i.days.ago}

    end
  end

end