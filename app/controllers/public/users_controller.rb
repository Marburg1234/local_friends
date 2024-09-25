class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit, :my_page, :unsubscribe]
  before_action :ensure_log_in_user, only: [:edit, :update]
  before_action :check_not_active_user, only: [:show, :post_index, :edit]

  # 特定ユーザーの投稿一覧を表示する
  def post_index
    @user = User.find(params[:id])
    @trips = @user.trips.page(params[:page]).per(8)
  end

  # ランダムでユーザーを表示する
  def index
    users = User.where.not(id: current_user.id).where.not(is_active: false).where.not(email: "guest@example.com").all.shuffle
    @users = Kaminari.paginate_array(users).page(params[:page]).per(12)
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
    flash[:notice] = "退会しました。またのご利用お待ちしております！"
    redirect_to new_user_registration_path
  end

# ================================================
  # いいねした記事一覧を表示するメソッドlikes
  def likes
    @user = current_user
    @favorites = @user.favorites.page(params[:page]).per(4)
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
      flash[:alert] =  "ゲストユーザーはマイページを利用できません"
      redirect_to trips_path
    end
  end

# 他人の編集ページへ直接アクセスするのを防ぐメソッド
  def ensure_log_in_user
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to my_page_users_path
    end
  end

# 退会したユーザーのshowページへ直接アクセスするのを防ぐメソッド
# 同時にparams 1000などで直接アクセスされた際にリダイレクトする (RecordNotFoundエラーを防ぐ)
  def check_not_active_user
    begin
      @user = User.find(params[:id])
      unless @user.is_active == true
        redirect_to users_path, alert: "このユーザーは退会しています。"
      end
    rescue ActiveRecord::RecordNotFound
      redirect_to users_path, alert: "ユーザーが見つかりませんでした。"
    end
  end

end
