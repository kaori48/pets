class Blog < ApplicationRecord
	belongs_to :user,optional: true #関連先を検査しないようにする
	has_many :blog_comments
	attachment :blog_image #refile,id入れない
end
