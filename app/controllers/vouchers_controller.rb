class VouchersController < ApplicationController
  skip_before_action :authenticate_user!, except: [:create, :new]
  def index
    @vouchers = policy_scope(Voucher)
  end

  def show
    @voucher = Voucher.find(params[:id])
    @booking = Booking.new()
    authorize @voucher
  end

  def new
   @voucher = Voucher.new
   authorize @voucher
  end

  def create
    @voucher = Voucher.new(voucher_params)
    @voucher.user = current_user
    authorize @voucher
    if @voucher.save
      redirect_to voucher_path(@voucher)
    else
      render :new
    end
  end

  def edit
    @voucher = Voucher.find(params[:id])
    authorize @voucher
  end

  def update
    @voucher = Voucher.find(params[:id])
    authorize @voucher
    @voucher.update(voucher_params)
    redirect_to voucher_path
  end

  def destroy
    @voucher = Voucher.find(params[:id])
    authorize @voucher
    @voucher.destroy
    redirect_to vouchers_path
  end

  private

  def voucher_params
    params.require(:voucher).permit(:name, :category, :price, :quantity_left, :description, :end_date, :photo)
  end
end
