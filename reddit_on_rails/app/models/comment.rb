class Comment < ApplicationRecord
  # validates :parent_comment_id, allow_nil: true 
  belongs_to :post
  belongs_to :parent_comment
  belongs_to :user

  has_many :child_comments,
    class_name: :Comment,
    foreign_key: :parent_comment_id



end
