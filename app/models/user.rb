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
  has_many :user_rooms, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :chat_rooms, through: :user_rooms

# ========================================================================================
  validates :first_name, presence: true
  validates :family_name, presence: true
  validates :introduction, presence: true
  validates :age, presence: true
  validates :topic, presence: true
# ========================================================================================

# ========================================================================================
  # プロフィール写真を扱う
  has_one_attached :profile_image
  # ユーザーのサブ写真を扱う
  has_many_attached :sub_images
# ========================================================================================

# ========================================================================================
  # フォローフォロワー機能
  # ============フォローする・している側からの視点===========================================
  # フォローする側の情報についての紐づけ
  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  # activeを通して、フォローされる人の情報を取得する⇒source:followerになる
  has_many :followings, through: :active_relationships, source: :followed

  # # =======================================================================================

  # # ==========フォロワー側の視点・フォローされる方=========================================
  # Railsの命名規則の観点から、followed→followers(単数形⇒複数形)として認識してくれる
  # フォローされる側の情報についての紐付け
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :followed_id, dependent: :destroy
  # passiveを通して、フォローしてくるユーザー情報を取得⇒source: :followingになる
  has_many :followers, through: :passive_relationships, source: :following
  # ========================================================================================
# ========================================================================================

  # プロフィール写真を表示させるためのメソッドを定義する
  # Rails側で画像を読み込むように設定する
  # ==========================================================================================================
  def get_profile_image
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpg')
    end
    profile_image
  end
  # ========================================================================================

# ========================================================================================
  # サブ写真を表示させるためのメソッドを定義する
  # Rails側で画像を読み込むように設定する
  def get_sub_images
    unless sub_images.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      sub_images.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpg')
    end
    sub_images
  end
# ========================================================================================

# ========================================================================================
  # 検索するためのメソッド とりあえずfamily_nameカラムを設定している
  def self.looks(search, word)
    if search == "perfect_match"
      @user = User.where("family_name LIKE?", "#{word}")
    elsif search == "forward_match"
        @user = User.where("family_name LIKE?", "#{word}%")
    elsif search == "backward_match"
      @user = User.where("family_name LIKE?", "%#{word}")
    elsif search == "partial_match"
      @user = User.where("family_name LIKE?","%#{word}%")
    else
      @user = User.all
    end
  end
# ========================================================================================

# ========================================================================================
  # フォローされているかどうかを確認するメソッド
  def followed_by?(user)
    # 今自分が(引数のユーザー)がフォローしようとしているユーザー(受け側)がフォローしているかどうかを判別する
    passive_relationships.find_by(following_id: user.id).present?
  end
# ========================================================================================

# ========================================================================================
  # ゲストログインのメソッド
  GUEST_USER_EMAIL = "guest@example.com"

  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.family_name = "ゲストユーザー"
      user.first_name = 'ゲストユーザー'
      # user.country_id = 1
      # user.region_id = 1
      # user.mother_language_id = 1
      # user.practice_language_id = 2
      # user.introduction = "ゲストユーザーです！"
      # user.age = 50
      # user.topic = "ゲストユーザーです！"
    end
  end
# ========================================================================================

end
