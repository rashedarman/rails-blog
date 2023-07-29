class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', counter_cache: :posts_counter
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  attribute :comments_counter, :integer, default: 0
  attribute :likes_counter, :integer, default: 0

  def update_post_counter
    author.update(posts_counter: author.post.count)
  end

  def five_most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  validates :title, presence: true, length: { in: 1..250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
