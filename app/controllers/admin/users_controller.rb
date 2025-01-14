module Admin
  class UsersController < ApplicationController
    before_action :authenticate_admin!

    def index
      @users = User.all
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to admin_users_path, notice: 'ユーザーを削除しました'
    end
  end
end
