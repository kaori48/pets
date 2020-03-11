class AnimalPermit < ApplicationRecord
	belongs_to :permitter, class_name: "User"#followerテーブル（user.rbで指定）はないのでUserテーブルを呼ぶよう指定
	belongs_to :permitted, class_name: "User"#followedテーブル（user.rbで指定）はないのでUserテーブルを呼ぶよう指定
end
