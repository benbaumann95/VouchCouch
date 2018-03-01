class Voucher < ApplicationRecord
  include AlgoliaSearch
  belongs_to :user
  validates :name, presence: true
  validates :category, inclusion: { in: [
    "Marketplace",
    "Fashion",
    "Travel",
    "Food & Drink",
    "Electronics",
    "Hobbies",
    "Services"
  ] }
  validates :price, presence: true
  validates :end_date, presence: true
  validates :quantity_left, presence: true
  mount_uploader :photo, PhotoUploader

  algoliasearch do
    attribute :name, :category, :description
  end

  def photo_file
    case self.category
      when "Food & Drink" then 'food_and_drink'
      when "Marketplace" then 'marketplace'
      when "Fashion" then 'fashion'
      when "Travel" then 'travel'
      when "Hobbies" then 'hobbies'
      when "Electronics" then 'electronics'
      when "Services" then 'service'
    end
  end
end
