# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  admin                  :boolean          default(FALSE)
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :user_profile, dependent: :destroy
  has_many :friend_connections
  has_many :friends, through: :friend_connections

  has_many :albums, dependent: :destroy

  after_create :create_default_album
  after_destroy :delele_friendships

  def full_name
    if user_profile
      user_profile&.first_name + ' ' + user_profile&.last_name
    else
      email
    end
  end

  private
  def delele_friendships
    FriendConnection.where(user: self).destroy_all
    FriendConnection.where(friend: self).destroy_all
  end

  private
  def create_default_album
    albums << Album.create(name: 'Default')
  end
end
