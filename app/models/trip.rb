class Trip < ApplicationRecord

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :trip_comments, dependent: :destroy
  has_many :tags, dependent: :destroy
  has_many :notifications, as: :notifiable, dependent: :destroy

  validates :address, presence: true, length: { minimum: 2 }
  validates :title, presence: true
  validates :explain, presence: true

  has_one_attached :trip_image
  validates :trip_image, content_type: ['image/png', 'image/jpeg', 'image/jpg'], size: { less_than: 5.megabytes }

  geocoded_by :address
  after_validation :geocode

  # コールバック機能 通知のメソッドを呼び出す(tripモデルにレコードが登録されたら発動するafter_create)
  after_create :notify_followers

  # 任意の並び替えができるようにする(新しい順/古い順/いいねの多い順)
  scope :latest, -> { order(created_at: :desc) }
  scope :old, -> { order(created_at: :asc) }
  scope :favorite_count, -> { left_joins(:favorites).group(:id).order('COUNT(favorites.id) DESC') }

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

  private

  def notify_followers
    user.followers.each do |follower|
      Notification.create(user_id: follower.id, notifiable: self)
    end
  end

end
