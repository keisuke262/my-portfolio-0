# frozen_string_literal: true

class Inquiry < ApplicationRecord
  before_save { email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :section, presence: true, length: { maximum: 50 }
  validates :date, presence: true, length: { maximum: 100 }
  validates :time, presence: true, length: { maximum: 100 }
  validates :message, presence: true, length: { maximum: 500 }
end


validates :name, presence: true, length: { maximum: 50 }
  # password_digestカラムを用意し、
  #モデルファイルにhas_secure_passwordを記述すれば
  #ログイン認証が可能になる
  has_secure_password