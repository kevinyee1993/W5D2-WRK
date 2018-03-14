class PostSub < ApplicationRecord
  validates :post_id, presence: true, uniqueness: { scope: :sub_id }

  belongs_to :sub
  belongs_to :post
end
