class Relationship < ApplicationRecord
	#relationshipモデルの
	belongs_to :follower, class_name: "User"#followerテーブル（user.rbで指定）はないのでUserテーブルを呼ぶよう指定
	belongs_to :followed, class_name: "User"#followedテーブル（user.rbで指定）はないのでUserテーブルを呼ぶよう指定
end
