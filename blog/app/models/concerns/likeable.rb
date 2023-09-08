module Likeable
  extend ActiveSupport::Concern

  def create_like(user)
    like = PolyLike.new(user: user, likeable: self)
    like.save
  end
end
