class Admin::TripsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @trips = Trip.all.page(params[:page]).per(5)
    @all_trips = @trips.count
  end

  def show
    @trip = Trip.find(params[:id])
    @trip_index = @trip.trip_comments.page(params[:page]).per(5)
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    flash[:notice] = "選択した投稿記事を削除しました"
    redirect_to admin_trips_path
  end

end
