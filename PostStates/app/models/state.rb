class State < ApplicationRecord
	belongs_to :user
	has_many :comments
	validates_length_of :content, maximum: 140
end
