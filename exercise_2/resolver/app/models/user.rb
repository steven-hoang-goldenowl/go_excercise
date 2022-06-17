# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  # asscociation
  has_many :followers, foreign_key: :follower_id, class_name: 'Follow'
  has_many :followees, foreign_key: :followee_id, class_name: 'Follow'

  # validations
  validates :username, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }


  def follow
    followees.create(follower_id: params[:follower_id])
  end

  def unfollow
    followees.find_by(follower_id: params[:follower_id])&.destroy
  end

  def get_following
    followees
  end

  def get_followers
    followers
  end

  def followers_in_month
    followers.from_this_month
  end
end
