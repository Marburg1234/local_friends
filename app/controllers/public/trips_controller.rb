class Public::TripsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:new, :edit]
  before_action :check_not_active_user, only: [:show, :edit]
  before_action :ensure_log_in_user, only: [:edit, :update]

  def new
    @trip = Trip.new
  end

  def create
      @trip = Trip.new(trip_params)
      @trip.user_id = current_user.id
      tags = Vision.get_image_data(trip_params[:trip_image])
    if @trip.save
      tags.each do |tag|
        @trip.tags.create(name: tag)
      end
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
        if params[:old]
          @trips = @trips.old
        elsif params[:favorite_count]
          @trips = @trips.favorite_count
        else
          @trips = @trips.latest
        end
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

  def update
    @trip = Trip.find(params[:id])
    # 新しい画像がアップロードされているか確認
    if trip_params[:trip_image].present?
      # 新しい画像がアップロードされた場合、タグを取得
      tags = Vision.get_image_data(trip_params[:trip_image])
    else
      # 新しい画像がアップロードされていない場合、既存の画像を保持
      trip_params[:trip_image] = @trip.trip_image
      tags = [] # タグの更新は行わない
    end

    # 更新処理
    if @trip.update(trip_params)
      # 上記のif文で取得したtagsがあるかどうかで動作を分けている tagsを取得=新しい画像を選んだ場合 tagsがない=既存の画像のまま
      if tags.any?
        @trip.tags.destroy_all  # 新しい画像があった場合、既存のタグを削除
        tags.each do |tag|
          @trip.tags.create(name: tag)
        end
      end
      flash[:notice] = "編集内容を保存しました"
      redirect_to trip_path(@trip)
    else
      flash[:notice] = "編集に失敗しました"
      render :edit
    end
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    flash[:notice] = "選択した投稿記事を削除しました"
    redirect_to post_index_user_path(current_user)
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

  # 他人の投稿編集ページへ直接アクセスするのを防ぐメソッド
  def ensure_log_in_user
    @trip = Trip.find(params[:id])
    unless @trip.user_id == current_user.id
      redirect_to trip_path(@trip)
    end
  end


end
