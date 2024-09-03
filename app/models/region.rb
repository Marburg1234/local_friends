class Region < ApplicationRecord

  belongs_to :country
  has_many :users, dependent: :destroy

end
