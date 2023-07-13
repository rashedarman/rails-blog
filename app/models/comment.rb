class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'

  def update_comment_counter
    post.update(comments_counter: post.comments.count)
  end
end
