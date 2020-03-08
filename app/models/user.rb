class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :blogs, dependent: :destroy
  has_many :blog_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  attachment :icon#icon_idだがrefileの仕様でidなし
  #ユーザーとフォローする人の関連づけ。Relationshipモデルのfollower_idにuser_idを格納
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy # フォロー取得
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy #フォロワー所得
  #自分がフォローしているユーザーと自分をフォローしているユーザーを簡単に取得するためにthrough（中間テーブルが複数ある場合に利用します）を使った関連付けも追記しましょう。
  has_many :following_user, through: :follower, source: :followed #自分がフォローしている人
  has_many :follower_user, through: :followed, source: :follower #自分をフォローしている人

  #フォローする・フォロー外す・フォローしているか確認を行うメソッドを作成
	# ユーザーをフォローする
	def follow(user_id)
		follower.create(followed_id: user_id)
	end
	#ユーザーのフォローを外す
	def unfollow(user_id)
		follower.find_by(followed_id: user_id).destroy
	end
	#フォローしていればtrueを返す
	def following?(user)
		following_user.include?(user)#include配列が val と == で等しい要素を持つ時に真を返します。
	end
end
