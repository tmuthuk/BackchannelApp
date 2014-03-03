class PostsController < ApplicationController


  def index
    @posts = Post.all
    @isadmin = session[:user_admin]
    if (params[:search]!='')
    @posts = Post.search(params[:search],params[:choice])
    else
      params[:search]=''
      redirect_to :back, alert: "Please enter a search text"
    end
    @post = Post.by_votes
    @current_user_name = session[:user_name]

  end
  def new
    @post = Post.new

  end

  def create

    if params[:vote]
      @post = current_user.posts.create!(params[:post])
    else
      @post = Post.new(params[:post])
    end
    @post.user_name = session[:user_name]

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  #def get_categories_for_select
   # cats = []
    #categories = Category.all
    #categories.each {|category| cats<<[category.category_name, category.id]}
    #return cats
#end


  def show
    @post = Post.find(params[:id])
    @user = User.all
    @username = @user.username
  end

  def edit
    @post = Post.find(params[:id])
   # @categories = get_categories_for_select
  end

  def update
    @post = Post.find(params[:id])
    if (@post.update_attributes(params[:post]))
      redirect_to @post
    else
      render 'edit'
    end
  end

  def vote
    vote = current_user.post_votes.new(value: params[:value], post_id: params[:id])
    @post=Post.find(params[:id])
    @post.countvotes = @post.countvotes.to_i + 1
    if (@post.update_attributes(params[:post]))
      # redirect_to @post

    end

    if vote.save
      redirect_to :back
    else
      redirect_to :back, alert: "Unable to vote, perhaps you already did."
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end




end