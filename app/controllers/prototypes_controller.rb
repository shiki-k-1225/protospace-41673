# app/controllers/prototypes_controller.rb
class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_prototype, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @prototypes = if params[:search].present?
                    Prototype.where('title LIKE ?', "%#{params[:search]}%").paginate(page: params[:page], per_page: 10)
                  else
                    Prototype.paginate(page: params[:page], per_page: 10)
                  end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = current_user.prototypes.build(prototype_params)
    if @prototype.save
      redirect_to prototype_path(@prototype), notice: 'プロトタイプが正常に作成されました。'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype), notice: 'プロトタイプが正常に更新されました。'
    else
      render :edit
    end
  end

  def destroy
    @prototype.destroy
    redirect_to prototypes_path, notice: 'プロトタイプが削除されました。'
  end

  private

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image, :tag_list)
  end

  def correct_user
    @prototype = current_user.prototypes.find_by(id: params[:id])
    redirect_to prototypes_path, notice: '許可されていないページです。' if @prototype.nil?
  end
end
