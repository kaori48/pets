class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :blogs, dependent: :destroy
  has_many :blog_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  attachment :icon#icon_idだがrefileの仕様でidなし
  validates :name, presence: true #空欄NG

#フォロー機能
  #ユーザーとフォローする人の関連づけ。Relationshipモデルのfollower_idにuser_idを格納
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy # 誰かをフォローしている
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy #誰かがフォローした人
  #:メソッド、中間テーブルのアソシエーション、sourceでrelationshipのbelongs_toへ
  has_many :following_user, through: :active_relationships, source: :followed #データ先指定
  has_many :follow_user, through: :passive_relationships, source: :follower #データ先指定

#ペット登録
  has_many :animals, dependent: :destroy
  has_many :animal_comments, dependent: :destroy#ペットのコメント
# ペット閲覧申請
  #ユーザーとフォローする人の関連づけ
  has_many :active_animal_permits, class_name: "AnimalPermit", foreign_key: "permitter_id", dependent: :destroy # 誰かを許可している人取得
  has_many :passive_animal_permits, class_name: "AnimalPermit", foreign_key: "permitted_id", dependent: :destroy # 誰かが許可した人取得
  #自分がフォローしているユーザーと自分をフォローしているユーザーをとりやすく、中間テーブル
  has_many :permitting_user, through: :active_animal_permits, source: :permitted #データ先指定
  has_many :permitted_user, through: :passive_animal_permits, source: :permitter #データ先指定


#フォローする・フォロー外す・フォローしているか確認を行うメソッドを作成
	# ユーザーをフォローする
	def follow(user_id)
    Relationship.create(follower_id: self.id, followed_id: user_id)#follower_id自分、followerd_idにuser_idをいれる
	end
	#ユーザーのフォローを外す
	def unfollow(user_id)
		Relationship.find_by(follower_id: self.id,followed_id: user_id).destroy
	end
	#フォローしていればtrueを返す
	def following?(user)
		following_user.include?(user)#include配列が val と == で等しい要素を持つ時に真を返します。
	end

#ペット登録
  #許可申請または許可しているか
  def permit(user_id)
    AnimalPermit.create(permitter_id: self.id, permitted_id: user_id)
  end
  #許可申請、許可を外す
  def unpermit(user_id)
    AnimalPermit.find_by(permitter_id: user_id, permitted_id: self.id).destroy
  end
  #閲覧許可申請または閲覧許可していればtrue
  def permitting?(user)
    permitting_user.include?(user)
  end
# 検索
    def User.search(search)
           User.where(['name LIKE ?', "%#{search}%"])
    end
end