class Animal < ApplicationRecord
	belongs_to :user
	attachment :animal_image #refile,id入れない
	has_many :animal_comments, dependent: :destroy#ペットのコメント
end
