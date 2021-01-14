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
end
