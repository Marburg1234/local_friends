class Public::UsersController < ApplicationController
  before_action :authenticate_user!

  # 特定ユーザーの投稿一覧を表示する
  def post_index
    @user = User.find(params[:id])
    @trips = @user.trips
  end

  def show
    @user = User.find(params[:id])
    @trips = @user.trips
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "編集内容を保存しました"
      redirect_to my_page_users_path
    else
      flash[:notice] = "編集に失敗しました"
      render :edit
    end
  end

  def my_page
    @user = current_user
    @trips = @user.trips
  end

  def unsubscribe
  end

  def withdraw
    @user = User.find(current_user.id)
    @user.update(is_active:false)
    reset_session
    flash[:notice] = "退会処理を実行しました"
    redirect_to root_path
  end

  def likes
    @user = current_user
    @favorites = @user.favorites
    @trip
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :family_name, :introduction, :topic, :profile_image, :practice_language_id, sub_images: [])
  end

end
