class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def dashboard
    @number_vouchers = Voucher.all.count
    @purchases = Booking.all.count
  end

  def voucher_file
  end
end
