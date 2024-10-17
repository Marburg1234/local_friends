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
    if notification.present?
      update
    else
      redirect_to request.referer
    end
  end


end
