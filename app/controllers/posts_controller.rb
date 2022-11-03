class PostsController < ApplicationController
  load_and_authorize_resource
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
    @current_user = current_user.id
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @comments = @post.comments
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.likescounter = 0
    @post.commentscounter = 0

    respond_to do |format|
      format.html do
        if @post.save
          flash[:success] = 'Post saved successfully'
          redirect_to user_post_path(current_user, @post.id)
        else
          flash.now[:error] = 'Error: Please try again. Post could not be saved. '
          render :new
        end
      end
    end
  end

  def destroy
    post = Post.find(params[:id])
    user = User.find(post.user_id)
    user.postscounter -= 1
    post.destroy
    user.save
    flash[:success] = 'You have deleted the post successfully!'
    redirect_to user_path(current_user.id)
    authorize! :destroy, @post
  end

end
