class Public::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :redirect_if_admin_signed_in, only: [:new]

  def after_sign_up_path_for(resource)
    flash[:notice] = "ようこそ！ 新規登録しました！"
    my_page_users_path
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys:[:first_name, :family_name, :country_id, :region_id, :mother_language_id, :practice_language_id, :age, :introduction, :topic])
  end

  def create
    build_resource(sign_up_params)
    if resource.save
      if resource.active_for_authentication?
      set_flash_message! :notice, :signed_up
      flash[:notice] = "新規登録し、サインアップしました！"
      sign_up(resource_name, resource)
      redirect_to after_sign_up_path_for(resource)
      else
      set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
      expire_data_after_sign_in!
      redirect_to after_inactive_sign_up_path_for(resource)
      end
    else
      resource.errors.clear
      clean_up_passwords resource
      flash[:registration_alert] = "出身国・地域・言語・年齢を選択してください"
      redirect_to new_user_registration_path
    end
  end


  def redirect_if_admin_signed_in
    if admin_signed_in?
      redirect_to admin_homes_top_path, notice: "管理者としてログインしています。ログアウトが必要です。"
    end
  end

end
