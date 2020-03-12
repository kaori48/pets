class AnimalPermit < ApplicationRecord
	belongs_to :permitter, class_name: "User"#followerテーブル（user.rbで指定）はないのでUserテーブルを呼ぶよう指定
	belongs_to :permitted, class_name: "User"#followedテーブル（user.rbで指定）はないのでUserテーブルを呼ぶよう指定
#閲覧許可
    enum status:{applying: 0,permit: 1}

end
