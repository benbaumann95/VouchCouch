class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @booking.voucher = @voucher
    @booking.user = current_user
    if @booking.save
      redirect_to vouchers_path
    else
      render :new
    end
  end
end
