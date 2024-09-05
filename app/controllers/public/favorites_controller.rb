class Public::FavoritesController < ApplicationController

  def create
    trip = Trip.find(params[:trip_id])
    favorite = current_user.favorites.new(trip_id: trip.id)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    trip = Trip.find(params[:trip_id])
    favorite = current_user.favorites.find_by(trip_id: trip.id)
    favorite.destroy
    redirect_to request.referer
  end

end
