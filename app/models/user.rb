class User < ApplicationRecord
  has_many :tips
  has_many :comments

  has_and_belongs_to_many :favourites, class_name: Tip.name

  validates :email, presence: true, uniqueness: true

  has_secure_password

  paginates_per 6
end
