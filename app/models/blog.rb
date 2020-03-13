class Blog < ApplicationRecord
	belongs_to :user
	has_many :blog_genre_relations
	has_many :genres, through: :blog_genre_relations#中間テーブルを経由して関連づけ
	has_many :blog_comments,dependent: :destroy
	has_many :favorites, dependent: :destroy
	attachment :blog_image #refile,id入れない
	validates :title, presence: true #空欄NG
	validates :body, presence: true
	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
end
