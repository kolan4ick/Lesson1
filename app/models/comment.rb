class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :object, polymorphic: true # object_id, object_type
  has_many :comments, as: :object
end
