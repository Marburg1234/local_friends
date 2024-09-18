class Public::TripCommentsController < ApplicationController

  def create
    @trip = Trip.find(params[:trip_id])
    @trip_index = @trip.trip_comments.page(params[:page]).per(5)
    @comment = current_user.trip_comments.new(trip_comment_params)
    @comment.trip_id = @trip.id
    @comment.save
  end

  def destroy
    @comment = TripComment.find(params[:id])
    @comment.destroy
    @trip = Trip.find(params[:trip_id])
    @trip_index = @trip.trip_comments.page(params[:page]).per(5)
  end


  private

  def trip_comment_params
    params.require(:trip_comment).permit(:comment)
  end

end
