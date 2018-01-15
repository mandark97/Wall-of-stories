# == Schema Information
#
# Table name: user_profiles
#
#  id          :integer          not null, primary key
#  description :text
#  first_name  :string
#  last_name   :string
#  photo       :string
#  private     :boolean
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class UserProfile < ApplicationRecord
  belongs_to :user
  mount_uploader :photo, PhotoUploader

end
