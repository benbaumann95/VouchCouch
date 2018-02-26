class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :voucher

  validates :quantity, presence: true
end
