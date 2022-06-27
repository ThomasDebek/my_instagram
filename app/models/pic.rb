class Pic < ApplicationRecord
	validates :title, presence: true
	validates :image, presence: true
	belongs_to :user
	has_one_attached :image
end
