class Comment < ApplicationRecord
  belongs_to :state
  belongs_to :user
  validates_length_of :comment, maximum: 140
end
