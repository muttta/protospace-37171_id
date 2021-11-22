class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :new, :show]
  def index
    @prototypes = Prototype.includes(:user)
  end

  def new
    #prototypeモデルの新規オブジェクトを代入
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
      if @prototype.save
          redirect_to root_path
      else
          render :new
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def edit
    @prototype = Prototype.find(params[:id])
    unless current_user == @prototype.user
      redirect_to root_path
    end
  end

  def update
    @prototype = Prototype.find(params[:id])
    unless current_user == @prototype.user
      redirect_to root_path
    end
    if @prototype.update(prototype_params)
      redirect_to prototype_path
    else
      render :edit
    end
  end

  def destroy
    unless current_user == @prototype.user
      redirect_to root_path
    end
    @prototype = Prototype.find(params[:id])
    @prototype.destroy
    redirect_to root_path
  end


  private
  def prototype_params
    params.require(:prototype).permit(:title, :concept, :catch_copy, :imeg).merge(user_id: current_user.id)
  end

end
