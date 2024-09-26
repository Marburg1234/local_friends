class TripComment < ApplicationRecord

  belongs_to :user
  belongs_to :trip

  validates :comment, presence: true, length: { in: 1..180 }

  # 新しい順に表示する
  default_scope { order(created_at: :desc) }

end
