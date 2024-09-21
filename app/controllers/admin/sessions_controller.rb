class Admin::SessionsController < Devise::SessionsController
  before_action :redirect_if_user_signed_in, only: [:new, :create]

  def after_sign_in_path_for(resource)
    flash[:notice] = "ログインしました！"
    admin_homes_top_path
  end

  def after_sign_out_path_for(resource)
    flash[:notice] = "ログアウトしました！"
    new_admin_session_path
  end


  private

  def redirect_if_user_signed_in
    if user_signed_in?
      redirect_to trips_path, notice: "管理者側へは遷移できません。ログアウトが必要です。"
    end
  end

end
