# frozen_string_literal: true

class Public::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]

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


  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
