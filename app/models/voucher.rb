class Voucher < ApplicationRecord
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
end
