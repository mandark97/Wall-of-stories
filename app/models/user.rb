class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :user_profile
  has_many :friend_connections
  has_many :friends, through: :friend_connections

  has_many :albums

  def full_name
    if user_profile
      user_profile&.first_name + ' ' + user_profile&.last_name
    else
      email
    end
  end
end
