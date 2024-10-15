class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

# ユーザー一覧表示=============================================================================
  def index
    # 全ユーザー情報を取得して10人1ページで表示する(ゲストは除く)
    @users = user_all_remove_guest.order(id: :asc).page(params[:page]).per(10)
    # 全ユーザーの人数を数える
    @users_count = user_all_count
    #有効ユーザーの人数と割合
    active_users_count_ration
    # 退会済みのユーザーの人数と割合
    not_active_users_count_ration
    # ============================================================
    # 国別の利用者数を表示するための情報を取得メソッド6を使用 (ゲスト,退会ユーザー除いている)
    @user_counts_per_country = active_users_data.group(:country_id).count

    # グラフ用のデータを準備
    @chart_data = {
      labels: @user_counts_per_country.keys.map { |country_id| Country.find(country_id).name },
      data: @user_counts_per_country.values
    }

    # ============================================================
    # 学習中の言語別人数を表示するための情報を取得(ゲスト,退会ユーザー除いている)
    @user_practice_language = active_users_data.group(:practice_language_id).count
    # ============================================================
  end
# ===============================================================================================

# ユーザー詳細・編集(ステータス変更)・更新=============================================================================
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
      flash[:notice] = "会員ステータスを変更しました"
      redirect_to admin_user_path(@user)
    else
      @user = User.find(params[:id])
      flash[:notice] = "失敗です"
      render :edit
    end
  end
# ===============================================================================================

  # ユーザーの物理削除
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "対象のユーザーを削除しました"
    redirect_to admin_users_path
  end

# 有効ユーザーの一覧表示=============================================================================
  def active_users
    # 全ユーザー情報を取得する
    @users = user_all_remove_guest
    # 全ユーザーの人数を数える
    @users_count = user_all_count

    # 有効ユーザーの情報を取得し10件ごとに表示する
    @active_users = active_users_data.all.order(id: :asc).page(params[:page]).per(10)
    #有効ユーザーの人数と割合
    active_users_count_ration
    # 退会済みのユーザーの人数と割合
    not_active_users_count_ration
  end
# ===============================================================================================

# 退会ユーザーの一覧表示=============================================================================
  def inactive_users
    # 全ユーザー情報を取得する
    @users = user_all_remove_guest
    # 全ユーザーの人数を数える
    @users_count = user_all_count
    #有効ユーザーの人数と割合
    active_users_count_ration

    # 退会済みユーザーを10件ごとに表示
    @not_actives = not_active_users_data.all.order(id: :asc).page(params[:page]).per(10)
    # 退会済みのユーザーの人数と割合
    not_active_users_count_ration
  end
# ===============================================================================================


  private

  def user_params
    params.require(:user).permit(:first_name, :family_name, :introduction, :topic, :profile_image, :practice_language_id, :is_active, sub_images: [])
  end

  # 全ユーザーを取得するメソッド(ゲストは除く)
  def user_all_remove_guest
    User.where.not(email: "guest@example.com").all
  end
  # 全ユーザーの人数を取得する
  def user_all_count
    user_all_remove_guest.count
  end

  # 有効ユーザーのデータを取得する
  def active_users_data
    User.where.not(is_active: false).where.not(email: "guest@example.com")
  end

  # 有効ユーザーの合計人数
  def active_users_count
    active_users_data.all.count
  end

  # 有効ユーザーの割合算出
  def active_user_ration
    @active_users_all * 100 / @users_count
  end

  #退会ユーザーのデータを取得する
  def not_active_users_data
    User.where(is_active: false).where.not(email: "guest@example.com")
  end

  # 退会ユーザーの合計人数
  def not_active_users_count
    User.where(is_active: false).all.count
  end

  # 退会済みユーザーの割合算出
  def not_active_user_ration
    @not_active_users * 100 / @users_count
  end

  #まとめたメソッド
  def active_users_count_ration
    # 有効ユーザーの合計人数
    @active_users_all = active_users_count
    # 有効ユーザーの割合算出
    @active_user_ration = active_user_ration
  end

  def not_active_users_count_ration
    # 退会済みのユーザーの合計人数
    @not_active_users =  not_active_users_count
    # 退会済みユーザーの割合算出
    @not_active_user_ration = not_active_user_ration
  end

end