class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :notifiable, polymorphic: true


  private
  # chatを除いた通知データの取得
  def self.notification_except_chat(user)
    user.notifications.where(read: false).where.not(notifiable_type: "Chat")
  end

  # chatの通知データを取得
  def self.notification_chat(user)
    user.notifications.where(read: false).where(notifiable_type: "Chat")
  end

end
