class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.page(params[:page]).per(5)
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
      redirect_to admin_user_path
    else
      @user = User.find(params[:id])
      flash[:notice] = "編集に失敗しました"
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:first_name, :family_name, :introduction, :topic, :profile_image, :practice_language_id, :is_active, sub_images: [])
  end

end
