class Genre < ApplicationRecord
	has_many :blog_genre_relations
	has_many :blogs, through: :blog_genre_relations #中間テーブルを通して関連づけ
end