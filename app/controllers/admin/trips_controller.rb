class Admin::TripsController < ApplicationController
  before_action :authenticate_admin!

  def index
    not_active_users = User.where(is_active: false).pluck(:id)
    @trips = Trip.where.not(user_id: not_active_users).all.page(params[:page]).per(5)
    @all_trips = Trip.where.not(user_id: not_active_users).all.count
  end

  def show
    @trip = Trip.find(params[:id])
    # コメント用の変数定義
    @trip_index = @trip.trip_comments.page(params[:page]).per(5)
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    flash[:notice] = "選択した投稿記事を削除しました"
    redirect_to admin_trips_path
  end

end
