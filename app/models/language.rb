class Language < ApplicationRecord

  has_many :users, dependent: :destroy

  has_one_attached :flag

end
