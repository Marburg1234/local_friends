class NotificationsController < ApplicationController

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

end
