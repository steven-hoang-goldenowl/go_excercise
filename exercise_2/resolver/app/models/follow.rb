# == Schema Information
#
# Table name: follows
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  followee_id :integer
#  follower_id :integer
#
class Follow < ApplicationRecord
  # asscociation
  belongs_to :followee, class_name: 'User'
  belongs_to :follower, class_name: 'User'

  # validatitons
  validates :follower_id, uniqueness: { scope: :followee_id }
  validates :followee_id, uniqueness: { scope: :follower_id }

  # scope
  scope :from_this_month, -> {where("follows.created_at > ? AND follows.created_at < ?", Time.now.beginning_of_month, Time.now.end_of_month)}
end
