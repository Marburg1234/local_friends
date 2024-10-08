class Public::ChatsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:index, :show]
  before_action :check_follow_situation, only: [:show]
  before_action :check_not_active_user, only: [:show]


#============================================================================
# チャットルームの表示
  def show
    # チャット相手のユーザーをURLから取得する
    @user = User.find(params[:id])
    # 相互フォローしていないユーザーのチャット画面へは遷移できないようにするunless
    unless current_user.followed_by?(@user) && @user.followed_by?(current_user)
      redirect_to chats_path
    end
    # 現在ログイン中のユーザーが参加しているチャットルームの一覧を取得
    rooms = current_user.user_rooms.pluck(:chat_room_id)
    # 相手ユーザーとの共有チャットルームが存在するか確認
    user_rooms = UserRoom.find_by(user_id: @user.id, chat_room_id: rooms)
    unless user_rooms.nil?
      # 共有チャットルームが存在する場合、そのチャットルームを表示する
      @room = user_rooms.chat_room
    else
      # 共有チャットルームが存在しない場合、新しいチャットルームを作成する
      @room = ChatRoom.new
      @room.save

      # 新しいチャットルームに現在のユーザーと相手のユーザーを追加
      UserRoom.create(user_id: current_user.id, chat_room_id: @room.id)
      UserRoom.create(user_id: @user.id, chat_room_id: @room.id)
    end
    # チャットルームに関連付けられてたメッセージを取得
    @chats = @room.chats
    # @chat_image = @room.chats.image
    # 新しいメッセージの作成するために、空のChatオブジェクトを生成する
    @chat = Chat.new(chat_room_id: @room.id)
  end
#=============================================================================

#=============================================================================
   # メッセージの送信
  def create
    # フォームから送られるメッセージを取得し、現在のユーザーに関連づけて保存
    @chat = current_user.chats.new(chat_params)

    # バリデーションに合格しない場合はエラーを表示
    render :validate unless @chat.save
  end
#=============================================================================

#=============================================================================
  # メッセージの削除
  def destroy
    # ログイン中のユーザーに関連するメッセージを削除
    @chat = current_user.chats.find(params[:id])
    @chat.destroy
  end
#=============================================================================

#=============================================================================
  # チャット相手の一覧を表示する
  def index
    rooms = current_user.user_rooms.pluck(:chat_room_id)
    not_active_users = User.where(is_active: false).pluck(:id)
    @opponents = UserRoom.where(chat_room_id: rooms).where.not(user_id: current_user.id).where.not(user_id: not_active_users).pluck(:user_id)
    @users = User.where(id: @opponents)
  end
#=============================================================================

#=============================================================================
  private

  # フォームから送信されたパラメーターを安全に取得する⇒ストロングパラメーター定義
  def chat_params
    params.require(:chat).permit(:message, :chat_room_id, :image, :video)
  end

  # ゲストログインユーザーの直接URLのアクセスを阻止するメソッド
  def ensure_guest_user
    if current_user.email == "guest@example.com"
      flash[:alert] =  "ゲストユーザーはチャットを利用できません"
      redirect_to trips_path
    end
  end

  #退会ユーザーとのチャットページへの直接アクセスを防ぐ
  def check_not_active_user
    user = User.find(params[:id])
    unless user.is_active == true
      redirect_to my_page_users_path
    end
  end

  #相互フォローしているかの確認メソッド　before_actionで直接アクセスを防ぐ
  # 相互フォローしていない人同士で勝手にチャットルームが作られないようにする
  def check_follow_situation
    @user = User.find(params[:id])
    # 相互フォローしていないユーザーのチャット画面へは遷移できないようにするunless
    unless current_user.followed_by?(@user) && @user.followed_by?(current_user)
      redirect_to my_page_users_path
    end
  end

end
