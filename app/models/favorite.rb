class Favorite < ApplicationRecord

  belongs_to :user
  belongs_to :trip
  has_one :notification, as: :notifiable, dependent: :destroy

  # 通知のメソッドを呼び出す(いいねした=favoriteモデルにレコードが登録されたら発動する)
  after_create :notify_favorite


  private

  # いいねが起きた時にnotificationにデータを登録するメソッド
  def notify_favorite
    Notification.create(user_id: trip.user_id, notifiable: self)
  end

end
