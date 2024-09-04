class Public::TripsController < ApplicationController
  def new
    @trip = Trip.new
  end

  def index
    @trips = Trips.all
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def edit
    @trip = Trip.find(params[:id])
  end
end
