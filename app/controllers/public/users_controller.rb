class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit, :my_page, :unsubscribe]

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

# ================================================
  # いいねした記事一覧を表示するメソッドlikes
  def likes
    @user = current_user
    @favorites = @user.favorites
    @trip
  end
# ================================================

# ================================================
  # フォロー機能のメソッド
  def follows
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end
# ================================================

  private
# ストロングパラメーター
  def user_params
    params.require(:user).permit(:first_name, :family_name, :introduction, :topic, :profile_image, :practice_language_id, sub_images: [])
  end

# ゲストログインユーザーのダイレクトアタックを阻止するメソッド
  def ensure_guest_user
    if current_user.email == "guest@example.com"
      redirect_to trips_path, alert: "ゲストユーザーは投稿・編集できません"
    end
  end

end
