class BookingsController < ApplicationController
  before_action :set_voucher
  def create
    @booking = Booking.new(booking_params)
    @booking.voucher = @voucher
    @booking.user = current_user
    if @booking.save
      @voucher.quantity_left -= @booking.quantity
      @voucher.save
      redirect_to vouchers_path
    else
      render '/vouchers/show'
    end
  end

  private
  def set_voucher
    @voucher = Voucher.find(params[:voucher_id])
  end
  def booking_params
    params.require(:booking).permit(:quantity, :voucher_id, :user_id)
  end
end
