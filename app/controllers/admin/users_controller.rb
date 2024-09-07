class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.all
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
      redirect_to admin_users_path
    else
      @user = User.find(params[:id])
      flash[:notice] = "編集に失敗しました"
      render :edit
    end
  end

  # def change_status
  #   @user = User.find(params[:id])
  #   if @user.is_active == true
  #     @user.update(is_active:false)
  #     reset_session
  #     flash[:notice] = "退会処理を実行しました"
  #     redirect_to admin_user_path
  #   else
  #     @user.update(is_active:true)
  #     flash[:notice] = "会員ステータスを有効に変更しました"
  #     redirect_to admin_user_path
  #   end
  # end

  private

  def user_params
    params.require(:user).permit(:first_name, :family_name, :introduction, :topic, :profile_image, :practice_language_id, :is_active, sub_images: [])
  end

end
