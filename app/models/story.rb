class Story < ActiveRecord::Base
	validates :title, presence: true
	validates :body, presence: true
	validates :url, presence: true, uniqueness: true

	has_many :comments
	has_many :votes
end
