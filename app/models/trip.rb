class Trip < ApplicationRecord

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :trip_comments, dependent: :destroy

  validates :post_code, presence: true, format: { with: /\A\d{7}\z/, message: "はハイフンなしの数字で入力してください" }
  validates :address, presence: true, length: { minimum: 2 }
  validates :title, presence: true
  validates :explain, presence: true

  has_one_attached :trip_image
  validates :trip_image, content_type: ['image/png', 'image/jpeg', 'image/jpg'], size: { less_than: 5.megabytes }

  geocoded_by :address
  after_validation :geocode

  # 新しい順に表示する
  default_scope { order(created_at: :desc) }

  def address_display
    '〒' + post_code + ' ' + address + ' ' + name
  end

  # 投稿画像を取得するメソッド
  def get_trip_image
    unless trip_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      trip_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpg')
    end
    trip_image
  end

  # いいねをしているか確認するメソッド
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  # 検索するためのメソッド 部分一致検索のみに変更した
  def self.looks(search, word)
    @trip = Trip.where("title LIKE? OR `explain` LIKE? OR post_code LIKE? OR address LIKE?", "%#{word}%", "%#{word}%", "%#{word}%", "%#{word}%")
  end

end
