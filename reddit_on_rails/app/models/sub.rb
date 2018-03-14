# == Schema Information
#
# Table name: subs
#
#  id          :integer          not null, primary key
#  title       :string
#  description :string
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Sub < ApplicationRecord

  validates :title, :description, :user, presence: true

  belongs_to :user
  has_many :post_subs

  has_many :posts,
  through: :post_subs,
  source: :post

end
