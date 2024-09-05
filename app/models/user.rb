class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :country
  belongs_to :region
  belongs_to :mother_language, class_name: "Language", foreign_key: "mother_language_id"
  belongs_to :practice_language, class_name: "Language", foreign_key: "practice_language_id"
  has_many :trips, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :trip_comments, dependent: :destroy

  validates :first_name, presence: true
  validates :family_name, presence: true
  validates :introduction, presence: true
  validates :age, presence: true
  validates :topic, presence: true

  has_one_attached :profile_image
  has_many_attached :sub_images

  # プロフィール写真を表示させるためのメソッドを定義する
  # Rails側で画像を読み込むように設定する
  def get_profile_image
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpg')
    end
    profile_image
  end

  # サブ写真を表示させるためのメソッドを定義する
  # Rails側で画像を読み込むように設定する
  def get_sub_images
    unless sub_images.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      sub_images.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpg')
    end
    sub_images
  end

end
