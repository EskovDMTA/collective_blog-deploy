# frozen_string_literal: true

class PostComment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_ancestry

  validates :content, presence: true, length: { minimum: 1, maximum: 400 }
end
