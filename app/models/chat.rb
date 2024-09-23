class Chat < ApplicationRecord

  belongs_to :user
  belongs_to :chat_room

  # 画像と動画を扱えるように追記
  has_one_attached :image
  has_one_attached :video

  # メッセージは空白でもいいように変更
  validates :message, length: { maximum: 140 }, allow_blank: true


  # ==========================================================================================================
  def get_image
    if image.attached?
      image
    else
      nil
    end
  end

end
