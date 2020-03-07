class Blog < ApplicationRecord
	belongs_to :user
	has_many :blog_genre_relations
	has_many :genres, through: :blog_genre_relations#中間テーブルを経由して関連づけ
	has_many :blog_comments
	attachment :blog_image #refile,id入れない
end
