class Public::TripsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:new, :edit]

  def new
    @trip = Trip.new
  end

  def create
      @trip = Trip.new(trip_params)
      @trip.user_id = current_user.id
    if @trip.save
      flash[:notice] = "投稿しました！"
      redirect_to trips_path
    else
      @trip = Trip.new
      flash[:notice] = "投稿に失敗しました"
      render :new
    end
  end

  # 投稿一覧表示：退会済みユーザーの投稿を表示しない
  def index
    # 退会済みユーザーのidを取得する(whereで条件指定→pluckでidを取得する)
    not_active_users = User.where(is_active: false).pluck(:id)
    # 取得した退会ユーザーのidを使用して、記事を探す際に退会ユーザー分を除外する
    @trips = Trip.where.not(user_id: not_active_users).page(params[:page]).per(5)
  end

  def show
    @trip = Trip.find(params[:id])
    @trip_comment = TripComment.new
  end

  def edit
    @trip = Trip.find(params[:id])
  end


  private

  def trip_params
    params.require(:trip).permit(:trip_image, :post_code, :address, :title, :explain)
  end

# ゲストログインユーザーの直接アクセスを阻止するメソッド
  def ensure_guest_user
    if current_user.email == "guest@example.com"
      redirect_to trips_path, alert: "ゲストユーザーは投稿・編集できません"
    end
  end

end
