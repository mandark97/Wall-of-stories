class Story < ApplicationRecord
  belongs_to :album
  has_many :comments

  enum type: { text: 1, image: 2 }
end
