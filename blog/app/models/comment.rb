# frozen_string_literal: true

class Comment < ApplicationRecord
  include Visible
  include Likeable

  belongs_to :article
  has_many :poly_likes, as: :likeable

  def count_likes
    poly_likes.count
  end
end
