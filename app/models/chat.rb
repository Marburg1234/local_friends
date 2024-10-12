class Chat < ApplicationRecord

  belongs_to :user
  belongs_to :chat_room
  has_many :notifications, as: :notifiable, dependent: :destroy

  # 画像と動画を扱えるように追記
  has_one_attached :image
  has_one_attached :video

  # メッセージは空白でもいいように変更
  validates :message, length: { maximum: 140 }, allow_blank: true

  after_create :notify_chat

  private

  # ==========================================================================================================
  def get_image
    if image.attached?
      image
    else
      nil
    end
  end
  # ===================================================================

  def notify_chat
    receiver = UserRoom.where(chat_room_id: chat_room_id).where.not(user_id: self.user_id).first
    if message.present? && image.attached?
      Notification.create(user_id: receiver.user_id, notifiable: self)
      Notification.create(user_id: receiver.user_id, notifiable: self)
    elsif message.present? || image.attached?
      Notification.create(user_id: receiver.user_id, notifiable: self)
    end
  end

end
