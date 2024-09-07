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

  def index
    @trips = Trip.all
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

# ゲストログインユーザーのダイレクトアタックを阻止するメソッド
  def ensure_guest_user
    if current_user.email == "guest@example.com"
      redirect_to trips_path, alert: "ゲストユーザーは投稿・編集できません"
    end
  end

end
