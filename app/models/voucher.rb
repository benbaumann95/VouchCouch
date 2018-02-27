class Voucher < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, uniqueness: true
  validates :category, inclusion: { in: [
    "Fashion",
    "Travel",
    "Restaurants",
    "Pubs & Bars",
    "Technology",
    "Books",
    "Music",
    "Games",
    "Movies"
  ] }
  validates :price, presence: true
  validates :end_date, presence: true
  validates :quantity_left, presence: true
  mount_uploader :photo, PhotoUploader
end
