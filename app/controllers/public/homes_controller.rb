class Public::HomesController < ApplicationController
  before_action :check_admin_signed_in, only: [:top]

  def top
  end

  def about
  end

  private

  def check_admin_signed_in
    if admin_signed_in?
      redirect_to admin_homes_top_path
    end
  end

end
