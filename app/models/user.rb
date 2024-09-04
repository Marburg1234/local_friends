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

  validates :first_name, presence: true
  validates :family_name, presence: true
  validates :introduction, presence: true
  validates :age, presence: true
  validates :topic, presence: true

  has_one_attached :profile_image
  has_one_attached :sub_image


  # プロフィール写真を表示させるためのメソッドを定義する
  def get_profile_image
    if profile_image.attached?
      profile_image
    else
      'no_image.jpg'
    end
  end

  # サブ写真を表示させるためのメソッドを定義する
  def get_sub_image
    if sub_image.attached?
      sub_image
    else
      'no_image.jpg'
    end
  end

end
