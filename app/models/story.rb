# == Schema Information
#
# Table name: stories
#
#  id         :integer          not null, primary key
#  text       :text
#  photo      :string
#  album_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  type       :integer
#

class Story < ApplicationRecord
  belongs_to :album
  has_many :comments

  enum type: { text: 1, image: 2 }
end
