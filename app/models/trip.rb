class Trip < ApplicationRecord

  belongs_to :user

  validates :post_code, presence: true, length: { is: 7 }
  validates :address, presence: true, length: { minimum: 2 }
  validates :title, presence: true
  validates :explain, presence: true

  def address_display
    '〒' + post_code + ' ' + address + ' ' + name
  end

end
