class Album < ApplicationRecord
  has_many :stories
  belongs_to :user
end
