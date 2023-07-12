class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  def update_post_counter
    author.update(posts_counter: author.post.count)
  end

  def five_most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
