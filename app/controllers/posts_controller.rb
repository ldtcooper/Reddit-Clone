class PostsController < ApplicationController

  def new

  end

  def show

  end

  def edit

  end

  def create
  end

  def destroy
  end
  
  private

  def post_params
    params.require(:post).permit(:title, :url, :content)
  end
end
