class Comment < ApplicationRecord
  belongs_to :post, counter_cache: :comments_counter
  belongs_to :author, class_name: 'User'

  after_save :update_comments_counter
  after_destroy :update_comments_counter

  private

  def update_comments_counter
    post.update(comments_counter: post.comments.count)
  end

  def as_json(options = {})
    super({ only: %i[text author_id post_id] }.merge(options))
  end
end
