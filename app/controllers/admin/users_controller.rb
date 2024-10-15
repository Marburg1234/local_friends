class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

# ユーザー一覧表示=============================================================================
  def index
    # 全ユーザー情報を取得して10人1ページで表示する(ゲストは除く)
    @users = User.where.not(email: "guest@example.com").all.order(id: :asc).page(params[:page]).per(10)

    # 全ユーザーの人数を数える
    @users_count = User.where.not(email: "guest@example.com").all.count

    # 有効ユーザーの合計人数 (退会済みとゲストを除いている) メソッド5
    @active_users_all = active_users_all
    # 有効ユーザーの割合算出 メソッド2
    @active_user_ration = active_user_ration

    # 退会済みのユーザーの合計人数 メソッド4
    @not_active_users = not_active_users
    # 退会済みユーザーの割合算出 メソッド3
    @not_active_user_ration = not_active_user_ration
    # ============================================================
    # 国別の利用者数を表示するための情報を取得メソッド6を使用 (ゲスト,退会ユーザー除いている)
    @user_counts_per_country = active_users_data.group(:country_id).count

    # グラフ用のデータを準備
    @chart_data = {
      labels: @user_counts_per_country.keys.map { |country_id| Country.find(country_id).name },
      data: @user_counts_per_country.values
    }

    # ============================================================
    # 学習中の言語別人数を表示するための情報を取得メソッド6を使用 (ゲスト,退会ユーザー除いている)
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
    # 全ユーザー情報を取得する(ゲストは除く) メソッド1を活用
    @users = user_all_remove_guest
    # 全ユーザーの人数を数える
    @users_count = @users.count

    # 有効ユーザーの情報を取得し10件ごとに表示する(退会済みとゲストを除く)
    @active_users = User.where.not(is_active: false).where.not(email: "guest@example.com").all.order(id: :asc).page(params[:page]).per(10)
    # 有効ユーザーの合計人数 (退会済みとゲストを除いている) メソッド5
    @active_users_all = active_users_all
    # 有効ユーザーの割合算出
    @active_user_ration = active_user_ration

    # 退会済みのユーザーの合計人数メソッド4
    @not_active_users =  not_active_users
    # 退会済みユーザーの割合算出
    @not_active_user_ration = not_active_user_ration
  end
# ===============================================================================================

# 退会ユーザーの一覧表示=============================================================================
  def inactive_users
    # 全ユーザー情報を取得する(ゲストは除く) メソッド1を活用
    @users = user_all_remove_guest
    # 全ユーザーの人数を数える
    @users_count = @users.count
    # 有効ユーザーの合計人数 (退会済みとゲストを除いている) メソッド5
    @active_users_all = active_users_all
    # 有効ユーザーの割合算出 メソッド2
    @active_user_ration = active_user_ration

    # 退会済みユーザーの情報取得と10件ごとに表示(退会済みを検索キーとして情報を抽出する)
    @not_actives = User.where(is_active: false).where.not(email: "guest@example.com").all.order(id: :asc).page(params[:page]).per(10)
    # 退会済みのユーザーの合計人数 メソッド4
    @not_active_users = not_active_users
    # 退会済みユーザーの割合算出 メソッド3
    @not_active_user_ration = not_active_user_ration
  end
# ===============================================================================================


  private

  def user_params
    params.require(:user).permit(:first_name, :family_name, :introduction, :topic, :profile_image, :practice_language_id, :is_active, sub_images: [])
  end

  # 全ユーザーを取得するメソッド(ゲストは除く) メソッド1
  def user_all_remove_guest
    User.where.not(email: "guest@example.com")
  end

  # 有効ユーザーの割合算出 メソッド2
  def active_user_ration
    @active_users_all * 100 / @users_count
  end

  # 退会済みユーザーの割合算出 メソッド3
  def not_active_user_ration
    @not_active_users * 100 / @users_count
  end

  # 退会済みのユーザーの合計人数 メソッド4
  def not_active_users
    User.where(is_active: false).all.count
  end

  # 有効ユーザーの合計人数 (退会済みとゲストを除いている) メソッド5
  def active_users_all
    User.where.not(is_active: false).where.not(email: "guest@example.com").all.count
  end

  # 有効ユーザーのデータ(たち)(退会済みとゲストを除く) メソッド6
  def active_users_data
    User.where.not(is_active: false).where.not(email: "guest@example.com")
  end

end