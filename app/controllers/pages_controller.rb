class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def dashboard
    @number_listings = current_user.vouchers.all.count
    @number_purchases = current_user.bookings.all.count
  end

  def voucher_file
  end
end
