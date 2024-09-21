class Admin::SearchesController < ApplicationController

  def search
    @range = params[:range]
    @word = params[:word]
    @search = "partial_match"

    if @range == "User"
      @users = User.looks(@search, @word)
      @users_count = @users.count
    else
      @trips = Trip.looks(@search, @word)
      @trips_count = @trips.count
    end
  end

end
