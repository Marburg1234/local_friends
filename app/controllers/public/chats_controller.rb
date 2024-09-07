class Public::ChatsController < ApplicationController

  # before_action :block_non_related_users, only: [:show]

# チャットルームの表示
  def show
    @user = User.find(params[:id])
    rooms = current_user.user_rooms.pluck(:room_id)
    user_rooms = UserRoom.find_by(user_id: @user.id, chat_room_id: rooms)

    unless user_rooms.nil?
      @room = user_room.room
    else
      @room = ChatRoom.new
      @room.save

      UserRoom.create(user_id: current_user.id, chat_room_id: @room.id)
      UserRoom.create(user_id: @user.id, chat_room_id: @room.id)
    end

    @chats = @room.chats
    @chat = Chat.new(chat_room_id: @room.id)
  end

  def create
    @chat = current_user.chats.new(chat_params)
    render :validate unless @chat.save
  end

  def desroy
    @chat = current_user.chats.find(params[:id])
    @chat.destroy
  end


  private

  # フォームから送信されたパラメーターを安全に取得する⇒ストロングパラメーター定義
  def chat_params
    params.require(:chat).permit(:message, :chat_room_id)
  end

   # 関連のないユーザーをブロックする
  def block_non_related_users
  # ユーザーがお互いにフォローしているか確認し、していないばあにはリダイレクト
    unless current_user.followed_by?(@user) && @user.followed_by?(current_user)
      redirect_to trips_path
    end
  end



end
