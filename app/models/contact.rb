# frozen_string_literal: true

class Contact < ApplicationRecord
  before_save { email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i } # , uniqueness: { case_sensitive: false }
  validates :message, presence: true, length: { maximum: 500 }
  validates :section, presence: true, length: { maximum: 50 }
  validates :sectiondate, presence: true, length: { maximum: 100 }
  validates :sectiontime, presence: true, length: { maximum: 100 }
end
