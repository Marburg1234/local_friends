class Public::TripCommentsController < ApplicationController

  def create
    trip = Trip.find(params[:trip_id])
    comment = current_user.trip_comments.new(trip_comment_params)
    comment.trip_id = trip.id
    comment.save
    redirect_to request.referer
  end

  def destroy
      comment = TripComment.find(params[:id])
      comment.destroy
      @trip = Trip.find(params[:book_id])
      redirect_to request.referer
  end

  private

  def trip_comment_params
    params.require(:trip_comment).permit(:comment)
  end

end