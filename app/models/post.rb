# frozen_string_literal: true

class Post < ApplicationRecord
  has_one_attached :image
  has_many_attached :images
  has_many :likes, dependent: :destroy

  has_many :comments, as: :object
  belongs_to :user
  def photo
    if image.attached?
      image
    else
      '/undefind.png'
    end
  end
end
