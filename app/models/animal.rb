class Animal < ApplicationRecord
	belongs_to :user
	attachment :animal_image #refile,id入れない
	has_many :animal_comments,-> { order("created_at desc")}, dependent: :destroy#ペットのコメント
	validates :name, presence: true #空欄NG
	has_many :tasks
end
