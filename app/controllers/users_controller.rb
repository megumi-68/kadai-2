class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :edit_account, :edit_profile]

  def show
  end

  def edit_account
  end

  def edit_profile
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'ユーザー情報を更新しました。'
    else
      flash.now[:alert] = '更新に失敗しました。入力内容をご確認ください。'
      render :edit_account
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :introduce, :icon)
  end
end