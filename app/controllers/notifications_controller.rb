class NotificationsController < ApplicationController
  before_action :check_is_record

  def update
    notification = current_user.notifications.find(params[:id])
    notification.update(read: true)
    case notification.notifiable_type
    when "Trip"
      redirect_to trip_path(notification.notifiable)
    when "Chat"
      redirect_to chats_path
    else
      redirect_to trip_path(notification.notifiable.trip)
    end
  end

  private

  def check_is_record
    notification = current_user.notifications.find_by(id: params[:id])
    # 通知が見つからない場合、または関連するレコードが見つからない場合
    if notification.nil? || notification.notifiable.nil?
      redirect_to request.referer, alert: "対象のレコードが存在しません。"
    else
      update
    end
  end



end
