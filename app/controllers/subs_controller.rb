class SubsController < ApplicationController
  before_action :require_moderator, only: [:edit, :update]
  before_action :require_logged_in, except: [:show, :index]

  def new

  end

  def show
    @sub = Sub.find(params[:id])
  end

  def index
    @subs = Sub.all
  end

  def edit
    render :edit
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.moderator_id = current_user.id
    if @sub.save
      redirect_to sub_url(@sub.id)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def update
    if @sub.update_attributes(sub_params)
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  private

  def require_moderator
    @sub = Sub.find(params[:id])
    unless current_user.id == @sub.moderator_id
      redirect_to sub_url(params[:id])
    end
  end

  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end
