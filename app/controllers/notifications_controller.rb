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
    notification = current_user.notifications.find(params[:id])
    if notification.nil? || notification.notifiable.nil?
      redirect_to trips_path, alert: "対象のレコードが存在しません。"
    else
      update
    end
  end


end
