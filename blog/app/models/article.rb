# frozen_string_literal: true

class Article < ApplicationRecord
  include Visible
  include Likeable

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :poly_likes, as: :likeable

  delegate :email, to: :user

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  def count_likes
    poly_likes.count
  end
end
