class Blog < ApplicationRecord
	belongs_to :user
	has_many :blog_genre_relations
	has_many :genres, through: :blog_genre_relations#中間テーブルを経由して関連づけ
	has_many :blog_comments,dependent: :destroy
	has_many :favorites, dependent: :destroy
	attachment :blog_image #refile,id入れない
	validates :title, presence: true #空欄NG
	validates :body, presence: true #空欄NG
	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

    def Blog.search(search, user_or_blog)
        if user_or_blog == "2"
           Blog.where(['title LIKE ?', "%#{search}%"])
        else
           Blog.all
        end
    end
end
