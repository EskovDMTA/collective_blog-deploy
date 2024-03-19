# frozen_string_literal: true

module LikesHelper
  def like_active?(post, current_user)
    post.likes.include?(current_user.post_likes.find_by(post:))
  end
end
