class Blog < ApplicationRecord
	belongs_to :user
	has_many :blog_comments
end
