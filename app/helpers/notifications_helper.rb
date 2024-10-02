module NotificationsHelper

  def notification_message(notification)
    case notification.notifiable_type
    when "Trip"
      "フォローしている#{notification.notifiable.user.full_name}さんが#{notification.notifiable.title}を投稿しました"
    when "Chat"
      "#{notification.notifiable.user.full_name}さんからメッセージがきています"
    else
      "投稿した#{notification.notifiable.trip.title}が#{notification.notifiable.user.full_name}さんにいいねされました"
    end
  end

end
