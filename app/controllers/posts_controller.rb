class PostsController < ApplicationController
  before_action :require_login, only: [:create, :new, :destroy]
  before_action :require_author, only: [:edit, :update, :destroy]

  def new
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    @post.sub_id = params[:sub_id]

    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to sub_url(@post.sub_id)
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :content)
  end

  def require_author
    @post = Post.find(params[:id])
    redirect_to post_url(@post) unless @post.author_id == current_user.id
  end
end
