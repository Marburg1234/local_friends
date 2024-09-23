class Public::MapsController < ApplicationController
  before_action :authenticate_user!

  # 特定の投稿の住所を地図でマーカー表示
  def show
    trip = Trip.find(params[:id])
    @trip_address = trip.address
  end

  # 投稿すべてを地図上でマーカー表示
  def index
  end

  # 地域の場所を地図で表示する
  def region
    @region = Region.find(params[:id])
    @region_name = @region.name
  end

end
