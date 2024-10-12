class TripComment < ApplicationRecord

  belongs_to :user
  belongs_to :trip

  validates :comment, presence: true, length: { in: 1..180 }
  validate :body_cannot_blacklist_words

  # 新しい順に表示する
  default_scope { order(created_at: :desc) }

  private

# 下品なコメントをはじくメソッド blacklistに入れた単語を含むコメントは送信できない
  def body_cannot_blacklist_words
    blacklist = ['死ね', '馬鹿', '殺す']
    if comment.present? && blacklist.any?{ |word| comment.include?(word) }
      errors.add(:contain_blacklist_words, ": 禁止単語が含まれています。")
    end
  end

end
