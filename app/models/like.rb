# class Like < ApplicationRecord
#   belongs_to :post
#   belongs_to :author, class_name: 'User'

#   # def update_likes_counter
#   #   post.update(likes_counter: post.likes.count)
#   # end

#   def self.update_like_counter(like_id)
#     like = find(like_id)
#     post = like.post
#     post.likes_counter = post.likes.count
#     post.save
#   end
# end

class Like < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'

  def update_likes_counter
    post.update(likes_counter: post.likes.count)
  end
end
