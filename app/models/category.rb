class Category < ApplicationRecord
  has_many :products

  scope :asc_by_name, ->{order :name}
  scope :limit_category, ->{limit Settings.category.limit}

  validates :name, presence: true
end
