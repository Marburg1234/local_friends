class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit, :my_page, :unsubscribe]
  before_action :check_not_active_user, only: [:show, :post_index, :edit]
  before_action :ensure_log_in_user, only: [:edit, :update]
  before_action :check_user_show_access, only: [:show]

  # 特定ユーザーの投稿一覧を表示する
  def post_index
    @user = User.find(params[:id])
    @trips = @user.trips.page(params[:page]).per(8)
  end

  # ランダムでユーザーを表示する
  def index
    @users = user_all

    case params[:sort_by]
      when 'country_region'
        if params[:country_id].present? && params[:region_id].present?
          @users = @users.where(country_id: params[:country_id], region_id: params[:region_id])
        end
      when 'language'
        if params[:mother_language_id].present?
          @users = @users.where(mother_language_id: params[:mother_language_id])
        end
      when 'nationality'
        if params[:nationality].present?
          @users = @users.where(nationality: params[:nationality])
        end
      else
        @users = @users.to_a.sample(12)
    end
  end

  # マイページ
  def my_page
    @user = current_user
    @trips = @user.trips
  end

  # ユーザー情報のページ
  def show
    @user = User.find(params[:id])
    @trips = @user.trips
  end

# ====================================================
  # ユーザー情報の編集
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
# ====================================================

# ===============================================
  # 退会確認するページ
  def unsubscribe
  end

  # 退会の処理
  def withdraw
    @user = User.find(current_user.id)
    @user.update(is_active:false)
    reset_session
    flash[:notice] = "退会しました。またのご利用お待ちしております！"
    redirect_to new_user_registration_path
  end
# ================================================

# ================================================
  # いいねした記事一覧を表示するメソッドlikes
  def likes
    user = current_user
    @favorites = user.favorites.page(params[:page]).per(5)
  end
# ================================================

# ================================================
  # フォロー機能のメソッド
  def follows
    @user = User.find(params[:id])
    @users = @user.followings.where.not(is_active: false)
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers.where.not(is_active: false)
  end
# ================================================


  private
# ストロングパラメーター
  def user_params
    params.require(:user).permit(:first_name, :family_name, :introduction, :topic, :profile_image, :practice_language_id, :country_id, :region_id, sub_images: [])
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

# 自分のshowページへ直接アクセスしたらマイページに遷移
  def check_user_show_access
    @user = User.find(params[:id])
    if @user.id == current_user.id
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

# 全ユーザー情報を取得する(ログインユーザー/ゲスト/退会ユーザーは除く)
  def user_all
    User.where.not(id: current_user.id).where.not(is_active: false).where.not(email: "guest@example.com").all
  end


end
