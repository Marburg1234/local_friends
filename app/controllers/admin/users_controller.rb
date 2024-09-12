class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    # 全ユーザー情報を取得して5人1ページで表示する(ゲストは除く)
    @users = User.page(params[:page]).per(5).where.not(email: "guest@example.com")
    # 全ユーザーの人数を数える
    @users_count = @users.count

    # 有効ユーザーの合計人数 (退会済みとゲストを除いている)
    @active_users_all = User.where.not(is_active: false).where.not(email: "guest@example.com").all.count
    # 有効ユーザーの割合算出
    @active_user_ration = @active_users_all * 100 / @users_count

    # 退会済みのユーザーの合計人数
    @not_active_users = User.where(is_active: false).all.count
    # 退会済みユーザーの割合算出
    @not_active_user_ration = @not_active_users * 100 / @users_count
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
      redirect_to admin_user_path
    else
      @user = User.find(params[:id])
      flash[:notice] = "編集に失敗しました"
      render :edit
    end
  end

  def active_users
    # 全ユーザー情報を取得して5人1ページで表示する(ゲストは除く)
    @users = User.where.not(email: "guest@example.com")
    # 全ユーザーの人数を数える
    @users_count = @users.count

    @active_users = User.page(params[:page]).per(5).where.not(is_active: false).where.not(email: "guest@example.com").all
    # 有効ユーザーの合計人数 (退会済みとゲストを除いている)
    @active_users_all = User.where.not(is_active: false).where.not(email: "guest@example.com").all.count
    # 有効ユーザーの割合算出
    @active_user_ration = @active_users_all * 100 / @users_count

    # 退会済みのユーザーの合計人数
    @not_active_users = User.where(is_active: false).all.count
    # 退会済みユーザーの割合算出
    @not_active_user_ration = @not_active_users * 100 / @users_count
  end

  def inactive_users
    # 全ユーザー情報を取得して5人1ページで表示する(ゲストは除く)
    @users = User.where.not(email: "guest@example.com")
    # 全ユーザーの人数を数える
    @users_count = @users.count

    # 有効ユーザーの合計人数 (退会済みとゲストを除いている)
    @active_users_all = User.where.not(is_active: false).where.not(email: "guest@example.com").all.count
    # 有効ユーザーの割合算出
    @active_user_ration = @active_users_all * 100 / @users_count

    @not_actives = User.page(params[:page]).per(5).where(is_active: false).all
    # 退会済みのユーザーの合計人数
    @not_active_users = User.where(is_active: false).all.count
    # 退会済みユーザーの割合算出
    @not_active_user_ration = @not_active_users * 100 / @users_count
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :family_name, :introduction, :topic, :profile_image, :practice_language_id, :is_active, sub_images: [])
  end


end
