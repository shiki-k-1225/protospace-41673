class LikesController < ApplicationController
  before_action :set_prototype

  def create
    @like = @prototype.likes.new(user: current_user)

    if @like.save
      respond_to do |format|
        format.html { redirect_to @prototype, notice: 'いいねしました。' }
        format.js
      end
    else
      respond_to do |format|
        format.html { redirect_to @prototype, alert: 'いいねできませんでした。' }
        format.js { render :error }
      end
    end
  end

  def destroy
    @like = @prototype.likes.find_by(user: current_user)

    if @like.destroy
      respond_to do |format|
        format.html { redirect_to @prototype, notice: 'いいねを取り消しました。' }
        format.js
      end
    else
      respond_to do |format|
        format.html { redirect_to @prototype, alert: 'いいねの取り消しに失敗しました。' }
        format.js { render :error }
      end
    end
  end

  private

  def set_prototype
    @prototype = Prototype.find(params[:prototype_id])
  end
end
