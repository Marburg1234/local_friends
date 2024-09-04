class Public::UsersController < ApplicationController

  def post_index
  end

  def show
    @user = User.find(params[:id])

    @trips = @user.trips
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "編集内容を保存しました"
      redirect_to user_path(@user)
    else
      flash[:notice] = "編集に失敗しました"
      render :edit
    end
  end


  def my_page

  end

  def unsubscribe
  end


  private

  def user_params
    params.require(:user).permit(:first_name, :family_name, :introduction, :topic, :profile_image, :practice_language_id, sub_images: [])
  end

end
