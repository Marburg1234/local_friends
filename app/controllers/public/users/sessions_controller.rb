class Public::Users::SessionsController < ApplicationController

# =================================================
  # ゲストログイン
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to trips_path, notice: "ゲストユーザーでログインしました"
  end
# =================================================

end