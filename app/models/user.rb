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

  validates :first_name, presence: true, length: { in 2..50 }
  validates :family_name, presence: true, length: { in 2..50 }
  validates :introduction, presence: true
  validates :age, presence: true
  validates :topic, presence: true



end
