class Comment < ApplicationRecord
  belongs_to :post, counter_cache: :comments_counter
  belongs_to :author, class_name: 'User'

  def self.update_comments_counter(post)
    post.update(comments_counter: where(post_id: post.id).count)
  end
end
