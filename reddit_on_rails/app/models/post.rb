# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  url        :string
#  content    :text
#  sub_id     :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  validates :title, :user, :url, presence: true
  belongs_to :user
  has_many :post_subs

  has_many :subs,
    through: :post_subs,
    source: :sub

  has_many :comments

end
