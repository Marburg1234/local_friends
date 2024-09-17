class Trip < ApplicationRecord

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :trip_comments, dependent: :destroy

  validates :post_code, presence: true
  validates :address, presence: true, length: { minimum: 2 }
  validates :title, presence: true
  validates :explain, presence: true

  has_one_attached :trip_image

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

  # 検索するためのメソッド
  def self.looks(search, word)
    if search == "perfect_match"
      @trip = Trip.where("title LIKE?", "#{word}")
    elsif search == "forward_match"
        @trip = Trip.where("title LIKE?", "#{word}%")
    elsif search == "backward_match"
      @trip = Trip.where("title LIKE?", "%#{word}")
    elsif search == "partial_match"
      @trip = Trip.where("title LIKE?","%#{word}%")
    else
      @trip = Trip.all
    end
  end

end
