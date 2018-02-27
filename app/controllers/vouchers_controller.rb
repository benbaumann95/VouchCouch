class VouchersController < ApplicationController
  def index
    @vouchers = Voucher.all
  end

  def show
    @voucher = Voucher.find(params[:id])
    @booking = Booking.new()
  end

  def new
   @voucher = Voucher.new
  end

  def create
    @voucher = Voucher.new(voucher_params)
    @voucher.user = current_user
    if @voucher.save
      redirect_to voucher_path(@voucher)
    else
      render :new
    end
  end

  def edit
    @voucher = Voucher.find(params[:id])
  end

  def update
    @voucher = Voucher.find(params[:id])
    @voucher.update(voucher_params)
    redirect_to voucher_path
  end

  def destroy
    @voucher = Voucher.find(params[:id])
    @voucher.destroy
    redirect_to vouchers_path
  end

  private

  def voucher_params
    params.require(:voucher).permit(:name, :category, :price, :description, :end_date, :photo)
  end
end
