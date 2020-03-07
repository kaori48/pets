class BlogComment < ApplicationRecord
	belongs_to :blog
	belongs_to :user
	validates :comment, presence: true#コメント空白不可
end
