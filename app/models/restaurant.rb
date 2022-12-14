class Restaurant < ApplicationRecord
  has_many :menus, dependent: :destroy
  has_many :user_restaurants, dependent: :destroy
  has_many :users, through: :user_restaurants
  has_one_attached :photo
end
