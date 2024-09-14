class Chat < ApplicationRecord

  belongs_to :user
  belongs_to :chat_room

  # 画像と動画を扱えるように追記
  has_one_attached :image
  has_one_attached :video

  # メッセージは空白でもいいように変更
  validates :message, length: { maximum: 140 }, allow_blank: true
  # いずれかの1つを送ることができるため、それ以外をエラーとしてはじくvalidate
  validate :only_one_type_of_attachment, :message_or_media_present?

  private

  def only_one_type_of_attachment
    if [message.present?, image.attached?, video.attached?].count(true) > 1
      errors.add(:base, "いずれか1つを送信することができます")
    end
  end

  def message_or_media_present?
    if [message.present?, image.attached?, video.attached?].count(true) == 0
      errors.add(:base, "いずれか1つを送信することができます")
    end
  end

end
