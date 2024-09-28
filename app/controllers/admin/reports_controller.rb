class Admin::ReportsController < ApplicationController
  before_action :authenticate_admin!

  def per_country
    # 全ユーザーの人数を数える
    @users_count = all_users_count
    # 国別の利用者数を表示するための情報を取得メソッド6を使用 (ゲスト,退会ユーザー除いている)
    @user_counts_per_country = active_users_data.group(:country_id).count

    # グラフ用のデータを準備
    @chart_data = {
      labels: @user_counts_per_country.keys.map { |country_id| Country.find(country_id).name },
      data: @user_counts_per_country.values
    }
  end

  def per_practice_language
    # 全ユーザーの人数を数える
    @users_count = all_users_count
    # 学習中の言語別人数を表示するための情報を取得メソッド6を使用 (ゲスト,退会ユーザー除いている)
    @user_practice_language = active_users_data.group(:practice_language_id).count

    # グラフ用のデータを準備
    @chat_data = {
      labels: @user_practice_language.keys.map { |practice_language_id| Language.find(practice_language_id).name },
      data: @user_practice_language.values
    }

  end

  private

  def all_users_count
    User.where.not(email: "guest@example.com").all.count
  end

  # 有効ユーザーのデータ(たち)(退会済みとゲストを除く) メソッド6
  def active_users_data
    User.where.not(is_active: false).where.not(email: "guest@example.com")
  end

end
