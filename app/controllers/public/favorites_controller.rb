class Public::FavoritesController < ApplicationController

  def create
    @trip = Trip.find(params[:trip_id])
    favorite = current_user.favorites.new(trip_id: @trip.id)
    favorite.save
  end

  def destroy
    @trip = Trip.find(params[:trip_id])
    favorite = current_user.favorites.find_by(trip_id: @trip.id)
    favorite.destroy
  end

end
