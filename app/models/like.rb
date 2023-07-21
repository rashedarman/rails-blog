class Like < ApplicationRecord
  belongs_to :post, counter_cache: :likes_counter
  belongs_to :author, class_name: 'User'

  def self.update_likes_counter(post)
    post.update(likes_counter: where(post_id: post.id).count)
  end
end
