class CommentsController < ApplicationController
  def create
    @prototype = Prototype.find(params[:prototype_id])
    @comment = @prototype.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      Notification.create(user_id: @prototype.user.id, prototype_id: @prototype.id, message: "#{@comment.user.name}さんがあなたのプロトタイプにフィードバックを投稿しました。")
      respond_to do |format|
        format.html { redirect_to prototype_path(@prototype, anchor: "comment-#{@comment.id}"), notice: 'コメントが正常に投稿されました。' }
        format.js
      end
    else
      @comments = @prototype.comments
      flash.now[:alert] = 'コメントの投稿に失敗しました。'
      respond_to do |format|
        format.html { render "prototypes/show", status: :unprocessable_entity }
        format.js { render :error }
      end
    end
  end

  def edit
    @prototype = Prototype.find(params[:prototype_id])
    @comment = @prototype.comments.find(params[:id])
  end

  def update
    @prototype = Prototype.find(params[:prototype_id])
    @comment = @prototype.comments.find(params[:id])
    if @comment.update(comment_params)
      redirect_to prototype_path(@prototype, anchor: "comment-#{@comment.id}"), notice: 'コメントが正常に更新されました。'
    else
      flash.now[:alert] = 'コメントの更新に失敗しました。'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    prototype = @comment.prototype
    @comment.destroy
    redirect_to prototype_path(prototype, anchor: "comments-section"), notice: 'コメントが正常に削除されました。'
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
