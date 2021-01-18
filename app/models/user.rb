class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :goal, presence: true, length: { maximum: 255 }
  validates :achieve, presence: true, length: { maximum: 255 }
  # password_digestカラムを用意し、
  #モデルファイルにhas_secure_passwordを記述すれば
  #ログイン認証が可能になる
  has_secure_password

  # 一対多の関係を表現
  # これによって、user.postsであるUserが投稿した
  # post一覧を取得することができる
  has_many :posts
  has_many :relationships
  # followingsモデルはないため、なんの情報を取得するかを
  # 後に追加情報として補足している
  # sourceで中間テーブルのカラムの何を参照すべきidであるかを指定している
  # この記述によって、user.followingsメソッドが使えるようになり
  # 自分がフォローしている人たちを取得できるようになる
  has_many :followings, through: :relationships, source: :follow
  has_many :reverses_of_relationship, class_name: 'Relationship', foreign_key: 'follow_id'
  # この記述によって、user.followersで自分をフォローしている人たちを取得できる
  has_many :followers, through: :reverses_of_relationship, source: :user

  # follow, unfollowするとは、中間テーブルのレコードを保存 or 削除すること
  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end 
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end
end
