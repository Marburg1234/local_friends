class Country < ApplicationRecord

  has_many :regions, dependent: :destroy
  has_many :users, dependent: :destroy

end
