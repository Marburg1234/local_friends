class Public::UsersController < ApplicationController
  def post_index
  end

  def edit
  end

  def show
    @user = User.find(params[:id])
    @trips = @user.trips
  end

  def my_page

  end

  def unsubscribe
  end
end
