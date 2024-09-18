class Public::TripsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:new, :edit]
  before_action :check_not_active_user, only: [:show, :edit]

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
    respond_to do |format|
      # htmlでのリクエストの場合の処理 (通常のindexへのアクセス)
      format.html do
        # 退会済みユーザーのidを取得する(whereで条件指定→pluckでidを取得する)
        not_active_users = User.where(is_active: false).pluck(:id)
        # 取得した退会ユーザーのidを使用して、記事を探す際に退会ユーザー分を除外する
        @trips = Trip.where.not(user_id: not_active_users).page(params[:page]).per(5)
      end
      # json形式でのリクエストの場合の処理 (APIやJS非同期のリクエストがきたとき)
      format.json do
        not_active_users = User.where(is_active: false).pluck(:id)
        @trips = @trips = Trip.where.not(user_id: not_active_users).all
      end
    end
  end

  def show
    respond_to do |format|
      format.html do
        @trip = Trip.find(params[:id])
        # paginateを入れておく コメント一覧
        @trip_index = @trip.trip_comments.page(params[:page]).per(5)
        @trip_comment = TripComment.new
      end
      format.json do
        @trip = Trip.find(params[:id])
      end
    end
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
      flash[:alert] =  "ゲストユーザーは新規投稿ページへ移動できません"
      redirect_to trips_path
    end
  end

# 退会したユーザーの投稿showページへ直接アクセスを防ぐメソッド
# 同時にparams1000などの直接アクセス RecordNotFoundエラーを防止する
  def check_not_active_user
    begin
      @trip = Trip.find(params[:id])
      unless @trip.user.is_active == true
        redirect_to trips_path
      end
    rescue ActiveRecord::RecordNotFound
      redirect_to trips_path
    end
  end

end
